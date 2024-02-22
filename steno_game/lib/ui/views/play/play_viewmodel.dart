import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:steno_game/app/app.router.dart';

import '../../../app/app.locator.dart';

class PlayViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  void goToStrokePlayPage() {
    _navigationService.navigateToStrokePlayView();
  }

  void goToTypingPlayPage() {
    _navigationService.navigateToTypingPlayView();
  }
}
