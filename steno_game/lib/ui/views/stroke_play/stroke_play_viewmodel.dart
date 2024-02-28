import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:steno_game/app/app.locator.dart';
import 'package:steno_game/app/app.router.dart';

class StrokePlayViewModel extends BaseViewModel {
  final _navService = locator<NavigationService>();

  void goToStrokeQuizView() {
    _navService.navigateToQuizGameStrokeView();
  }
}
