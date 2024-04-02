import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:steno_game/app/app.router.dart';
import 'package:steno_game/model/user.dart';
import 'package:steno_game/services/internet_service.dart';
import 'package:steno_game/services/shared_preference_service.dart';
import '../../../app/app.locator.dart';
import '../../../services/authentication_service.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthenticationService>();
  final _sharedPref = locator<SharedPreferenceService>();
  final _internetServ = locator<InternetService>();
  final _snackBar = locator<SnackbarService>();

  Future runStartupLogic() async {
    //_internetServ.streamInternet();
    await Future.delayed(const Duration(seconds: 3));
    bool hasInternet = await _internetServ.hasInternetConnection();
    if (await _sharedPref.getCurrentUser() != null) {
      bool? status = await _sharedPref.getIsPreviousOnline();
      if (status != null) {
        if (status == false) {
          final user = await _sharedPref.getCurrentUser();
          final response = await _authService.setCurrentUser(user!);
          response.fold(
              (l) => _snackBar.showSnackbar(
                  message: l.message, duration: const Duration(seconds: 3)),
              (r) => null);
        }
      }
      _navigationService.replaceWithHomeView();
    } else {
      if (hasInternet) {
        _navigationService.replaceWithLoginView();
      } else {
        User temporaryUser = User(
            id: DateTime.timestamp().millisecondsSinceEpoch.toString(),
            name: "User ${DateTime.timestamp().millisecondsSinceEpoch}",
            email: "",
            role: "Student");
        await _sharedPref.saveUser(temporaryUser);
        _navigationService.replaceWithHomeView();
      }
    }
  }
}
