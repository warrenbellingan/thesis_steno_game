import 'dart:async';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:steno_game/app/app.bottomsheets.dart';
import 'package:steno_game/app/app.locator.dart';
import 'package:steno_game/model/student.dart';
import 'package:steno_game/services/shared_preference_service.dart';
import '../../../repository/multiplayer_stroke_repository.dart';

class HostStrokeViewModel extends BaseViewModel {
  final _multiStrokeRepo = locator<MultiplayerStrokeRepository>();
  final _bottomSheet = locator<BottomSheetService>();
  final _sharedPref = locator<SharedPreferenceService>();

  final _navigationServ = locator<NavigationService>();

  StreamSubscription<List<Student>>? studentsStream;

  List<Student> students = [];

  String gameId = "";

  init() async {
    setBusy(true);
    final user = await _sharedPref.getCurrentUser();
    final response = await _multiStrokeRepo.createGame(user!.id);
    response.fold((l) => showBottomSheet(l.message), (gameHostId) {
      gameId = gameHostId;
      studentsStream =
          _multiStrokeRepo.streamStudents(gameHostId).listen((studentsData) {
        students = studentsData;
        rebuildUi();
      });
    });
    rebuildUi();
    setBusy(false);
  }

  Future<void> startGame() async {
    setBusy(true);
    final response = await _multiStrokeRepo.startGame(gameId);
    response.fold((l) => showBottomSheet(l.message), (r){
      print("GameStarted");
    });
    setBusy(false);
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
    super.dispose();
  }
}
