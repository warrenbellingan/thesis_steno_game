import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:steno_game/app/app.router.dart';

import '../../../app/app.locator.dart';
import '../../../services/authentication_service.dart';
import '../../../services/shared_preference_service.dart';

class LoginViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _authenticationService = locator<AuthenticationService>();
  final _snackBarService = locator<SnackbarService>();
  final _sharedPref = locator<SharedPreferenceService>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> logIn() async {
    setBusy(true);
    final response = await _authenticationService.login(
        email: emailController.text, password: passwordController.text);
    setBusy(false);
    response.fold(
        (l) => _snackBarService.showSnackbar(
            message: l.message, duration: Duration(seconds: 2)), (user) async {
      await _sharedPref.saveUser(user);
      _navigationService.replaceWithHomeView();
    });
  }

  void goToForgotPassword() {
    _navigationService.navigateToForgotPasswordView();
  }

  void goToSignUp() {
    _navigationService.navigateToSignUpView();
  }
}
