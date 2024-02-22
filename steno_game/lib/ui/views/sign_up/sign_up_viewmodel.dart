import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:steno_game/app/app.router.dart';

import '../../../app/app.locator.dart';
import '../../../services/authentication_service.dart';
import '../../../services/shared_preference_service.dart';

class SignUpViewModel extends BaseViewModel {
  final _authenticationService = locator<AuthenticationService>();
  final _snackBarService = locator<SnackbarService>();
  final _navigationService = locator<NavigationService>();
  final _sharedPref = locator<SharedPreferenceService>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController roleController = TextEditingController();

  Future<void> signUp() async {
    if (passwordController.text.toString() !=
            confirmPasswordController.text.toString() ||
        passwordController.text.isEmpty) {
      return _snackBarService.showSnackbar(
        message: "Password doesn't match ${passwordController.text}",
        duration: Duration(seconds: 2),
      );
    } else {
      setBusy(true);
      final response = await _authenticationService.signUp(
          name: nameController.text.toString(),
          email: emailController.text.toString(),
          password: passwordController.text.toString(),
          role: roleController.text.toString());
      setBusy(false);

      response.fold(
          (l) => _snackBarService.showSnackbar(
                message: l.message,
                duration: Duration(seconds: 2),
              ), (user) async {
        setBusy(true);
        final logInResponse = await _authenticationService.login(
            email: emailController.text, password: passwordController.text);
        setBusy(false);
        logInResponse.fold(
            (l) => _snackBarService.showSnackbar(
                message: "No User found in Logging In",
                duration: Duration(seconds: 2)), (user) async {
          await _sharedPref.saveUser(user);
          _navigationService.replaceWithHomeView();
        });
      });
    }
  }
}
