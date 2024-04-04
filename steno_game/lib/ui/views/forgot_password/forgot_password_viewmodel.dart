import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:steno_game/app/app.bottomsheets.dart';
import 'package:steno_game/app/app.locator.dart';
import 'package:steno_game/services/authentication_service.dart';
import 'package:steno_game/ui/common/input_validation.dart';

class ForgotPasswordViewModel extends BaseViewModel with InputValidation {
  final _authServ = locator<AuthenticationService>();
  final _bottomSheetServ = locator<BottomSheetService>();

  TextEditingController emailController = TextEditingController();

  Future<void> forgotPassword() async {
    if (validateEmail()) {
      setBusyForObject("forgot", true);
      final response =
          await _authServ.forgotPassword(email: emailController.text);
      setBusyForObject("forgot", false);
      response.fold((l) {
        showBottomSheet(l.message);
      }, (r) {
        showBottomSheet(
            "The reset link is send to your email account. Check your email messages!");
      });
      rebuildUi();
    }
  }

  bool validateEmail() {
    String? emailValidation = isValidEmail(emailController.text);
    if (emailValidation == null) {
      return true;
    } else {
      showBottomSheet(emailValidation);
      return false;
    }
  }

  void showBottomSheet(String description) {
    _bottomSheetServ.showCustomSheet(
      variant: BottomSheetType.notice,
      title: "Notice",
      description: description,
    );
  }
}
