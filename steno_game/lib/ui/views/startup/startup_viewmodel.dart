import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:steno_game/app/app.router.dart';
import 'package:steno_game/repository/user_repository.dart';
import 'package:steno_game/services/shared_preference_service.dart';
import '../../../app/app.locator.dart';
import '../../../services/authentication_service.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthenticationService>();
  final _sharedPref = locator<SharedPreferenceService>();

  // Place anything here that needs to happen before we get into the application
  Future runStartupLogic() async {
    await Future.delayed(const Duration(seconds: 3));

    // This is where you can make decisions on where your app should navigate when
    // you have custom startup logic
    if (_authService.isLoggedIn && await _sharedPref.getCurrentUser() != null) {
      _navigationService.replaceWithHomeView();
    } else {
      _navigationService.replaceWithLoginView();
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}
