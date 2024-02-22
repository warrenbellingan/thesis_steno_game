import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:steno_game/app/app.router.dart';

import '../../../app/app.locator.dart';

class ProfileViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  void logOut() {
    _navigationService.popRepeated(1);
    _navigationService.replaceWithLoginView();
  }
}
