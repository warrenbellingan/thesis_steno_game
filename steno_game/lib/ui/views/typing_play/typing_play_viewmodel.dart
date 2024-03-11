import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:steno_game/app/app.router.dart';

import '../../../app/app.locator.dart';

class TypingPlayViewModel extends BaseViewModel {
  final _navigationServ = locator<NavigationService>();

  void goToSpeedTyping() {
    _navigationServ.navigateToSpeedTypingView();
  }
}
