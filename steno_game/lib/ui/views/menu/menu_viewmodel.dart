import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:steno_game/app/app.locator.dart';
import 'package:steno_game/app/app.router.dart';
import 'package:steno_game/model/user.dart';

class MenuViewModel extends BaseViewModel {
  final _navigationServ = locator<NavigationService>();

  User user;
  MenuViewModel(this.user);

  bool isStudent() {
    return user.role == "Student";
  }

  void goToCreateHost() {
    _navigationServ.navigateToHostStrokeView();
  }

  void goToSearchSteno() {
    _navigationServ.navigateToSearchStenoView();
  }
}
