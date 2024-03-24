import 'dart:async';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:steno_game/app/app.router.dart';
import 'package:steno_game/repository/user_repository.dart';

import '../../../app/app.bottomsheets.dart';
import '../../../app/app.locator.dart';
import '../../../model/multiplayer_stroke.dart';
import '../../../model/student.dart';
import '../../../model/user.dart';
import '../../../repository/multiplayer_stroke_repository.dart';
import '../../../services/shared_preference_service.dart';

class MultiplayerStrokeWaitingRoomViewModel extends BaseViewModel {
  final _multiStrokeRepo = locator<MultiplayerStrokeRepository>();
  final _bottomSheet = locator<BottomSheetService>();
  final _sharedPref = locator<SharedPreferenceService>();
  final _navigationService = locator<NavigationService>();
  final _userRepo = locator<UserRepository>();

  StreamSubscription<List<Student>>? studentsStream;
  StreamSubscription<MultiplayerStroke>? gameStream;

  List<Student> students = [];
  late User user;
  late User instructor;

  MultiplayerStroke game;

  MultiplayerStrokeWaitingRoomViewModel(this.game);

  init() async {
    setBusy(true);
    user = (await _sharedPref.getCurrentUser())!;
    final getInstructor = await _userRepo.getUser(game.gameMaster);
    getInstructor.fold(
        (l) => showBottomSheet(l.message), (user) => instructor = user);
    studentsStream =
        _multiStrokeRepo.streamStudents(game.id).listen((studentsData) {
      students = studentsData;
      rebuildUi();
    });
    gameStream =
        _multiStrokeRepo.streamMultiplayerStroke(game.id).listen((gameData) {
      if (gameData.status == 1) {
        startGame();
      }
    });
    joinGame();
    rebuildUi();
    setBusy(false);
  }

  Future<void> joinGame() async {
    final response = await _multiStrokeRepo.joinGame(game.id);
    response.fold((l) => showBottomSheet(l.message), (r) {});
  }

  void startGame() {
    _navigationService.replaceWithStrokesMultiplayerView();
  }

  void showBottomSheet(String description) {
    _bottomSheet.showCustomSheet(
      variant: BottomSheetType.notice,
      title: "Notice",
      description: description,
    );
  }

  @override
  void dispose() {
    studentsStream?.cancel();
    gameStream?.cancel();
    super.dispose();
  }
}
