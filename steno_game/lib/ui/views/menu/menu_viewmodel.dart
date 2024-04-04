import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:steno_game/app/app.locator.dart';
import 'package:steno_game/app/app.router.dart';
import 'package:steno_game/model/user.dart';
import 'package:steno_game/repository/multiplayer_stroke_repository.dart';

import '../../../app/app.bottomsheets.dart';

class MenuViewModel extends BaseViewModel {
  final _navigationServ = locator<NavigationService>();
  final _multiGameStroke = locator<MultiplayerStrokeRepository>();
  final _bottomSheet = locator<BottomSheetService>();

  User user;
  MenuViewModel(this.user);

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

  void showBottomSheet(String description) {
    _bottomSheet.showCustomSheet(
      variant: BottomSheetType.notice,
      title: "Notice",
      description: description,
    );
  }
}
