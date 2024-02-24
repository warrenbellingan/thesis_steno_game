import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:steno_game/app/app.bottomsheets.dart';
import 'package:steno_game/app/app.router.dart';
import 'package:steno_game/ui/common/input_validation.dart';
import '../../../app/app.locator.dart';
import '../../../services/authentication_service.dart';
import '../../../services/shared_preference_service.dart';

class LoginViewModel extends BaseViewModel with InputValidation {
  final _navigationService = locator<NavigationService>();
  final _authenticationService = locator<AuthenticationService>();
  final _sharedPref = locator<SharedPreferenceService>();
  final _bottomSheetService = locator<BottomSheetService>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> logIn() async {
    if(validateInput()) {
      setBusy(true);
      final response = await _authenticationService.login(
          email: emailController.text, password: passwordController.text);
      setBusy(false);
      response.fold(
              (l) {
                showBottomSheet(l.message);
              }, (user) async {
        await _sharedPref.saveUser(user);
        _navigationService.replaceWithHomeView();
      });
    }

  }

  bool validateInput() {
    String? emailValidation = isValidEmail(emailController.text);
    String? passwordValidation = isValidPassword(passwordController.text);

    if(emailValidation == null) {
      if(passwordValidation == null) {
        return true;
      }
      else {
        showBottomSheet(passwordValidation);
        return false;
      }
    }
    else{
      showBottomSheet(emailValidation);
      return false;
    }

  }

  void goToForgotPassword() {
    _navigationService.navigateToForgotPasswordView();
  }

  void goToSignUp() {
    _navigationService.navigateToSignUpView();
  }

  void showBottomSheet(String description) {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.inputValidation,
      title: "Invalid Credential",
      description: description,
    );
  }
}
