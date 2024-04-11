import 'dart:async';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:steno_game/app/app.locator.dart';
import 'package:steno_game/app/app.router.dart';
import 'package:steno_game/model/user.dart';
import 'package:steno_game/repository/multiplayer_stroke_repository.dart';
import 'package:steno_game/repository/user_repository.dart';

import '../../../app/app.bottomsheets.dart';

class MenuViewModel extends BaseViewModel {
  final _navigationServ = locator<NavigationService>();
  final _multiGameStroke = locator<MultiplayerStrokeRepository>();
  final _bottomSheet = locator<BottomSheetService>();
  final _userRepo = locator<UserRepository>();

  User user;
  MenuViewModel(this.user);

  StreamSubscription? streamSubscription;

  List<User> users = [];

  init() async {
    setBusy(true);
    final response = await _userRepo.getTopUsers();
    response.fold((l) => showBottomSheet(l.message), (r) {
      users = users;
      streamSubscription = _userRepo.streamUsersScore().listen((usersData) {
        users = usersData;
        rebuildUi();
      });
    });

    setBusy(false);
  }
  bool isStudent() {
    return user.role == "Student";
  }

  void goToCreateHost() async {
    setBusy(true);
    final response = await _multiGameStroke.createGame(user.id);
    setBusy(false);
    response.fold((l) => showBottomSheet(l.message), (game) {
      _navigationServ.navigateToHostStrokeView(game: game);
    });
  }

  void goToSearchSteno() {
    _navigationServ.navigateToSearchStenoView();
  }

  void goToPractice() {
    _navigationServ.navigateToPracticeView();
  }

  void showBottomSheet(String description) {
    _bottomSheet.showCustomSheet(
      variant: BottomSheetType.notice,
      title: "Notice",
      description: description,
    );
  }

  void goToQuiz() {
    _navigationServ.navigateToQuizGameStrokeView();
  }

  @override
  void dispose() {
    streamSubscription?.cancel();
    super.dispose();
  }
}
