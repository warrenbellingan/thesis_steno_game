import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:steno_game/app/app.router.dart';
import 'package:steno_game/ui/common/input_validation.dart';
import '../../../app/app.bottomsheets.dart';
import '../../../app/app.locator.dart';
import '../../../services/authentication_service.dart';
import '../../../services/shared_preference_service.dart';

class SignUpViewModel extends BaseViewModel with InputValidation {
  final _authenticationService = locator<AuthenticationService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _navigationService = locator<NavigationService>();
  final _sharedPref = locator<SharedPreferenceService>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController roleController = TextEditingController();

  Future<void> signUp() async {
    if (validateInput()) {
      if (passwordController.text.toString() !=
              confirmPasswordController.text.toString() ||
          passwordController.text.isEmpty) {
       showBottomSheet("Password doesn't match!");
      } else {
        setBusy(true);
        final response = await _authenticationService.signUp(
            name: nameController.text.toString(),
            email: emailController.text.toString(),
            password: passwordController.text.toString(),
            role: roleController.text.toString());
        setBusy(false);

        response.fold(
            (l) {
              showBottomSheet(l.message);
            }, (user) async {
          setBusy(true);
          final logInResponse = await _authenticationService.login(
              email: emailController.text, password: passwordController.text);
          setBusy(false);
          logInResponse.fold(
              (l) {
                showBottomSheet("No user found in logging in");
              }, (user) async {
            await _sharedPref.saveUser(user);
            _navigationService.replaceWithHomeView();
          });
        });
      }
    }
  }

  bool validateInput() {
    String? emailValidation = isValidEmail(emailController.text);
    String? passwordValidation = isValidPassword(passwordController.text);
    String? nameValidation = isValidInput(nameController.text, "Name");
    String? roleValidation = isValidInput(roleController.text, "Role");
    if (roleValidation == null) {
      if (nameValidation == null) {
        if (emailValidation == null) {
          if (passwordValidation == null) {
            return true;
          } else {
            showBottomSheet(passwordValidation);
            return false;
          }
        } else {
          showBottomSheet(emailValidation);
          return false;
        }
      } else {
        showBottomSheet(nameValidation);
        return false;
      }
    } else {
      showBottomSheet(roleValidation);
      return false;
    }
  }

  void showBottomSheet(String description) {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.inputValidation,
      title: "Invalid Credential",
      description: description,
    );
  }
}
