import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:steno_game/ui/custom_widgets/game_loading.dart';
import '../../constants/game_png.dart';
import '../../constants/game_ui_text.dart';
import '../../custom_widgets/game_bar.dart';
import '../../custom_widgets/game_body.dart';
import '../../custom_widgets/game_button.dart';
import '../../custom_widgets/game_image.dart';
import '../../custom_widgets/game_textfield.dart';
import '../../custom_widgets/game_title_text.dart';
import 'forgot_password_viewmodel.dart';

class ForgotPasswordView extends StackedView<ForgotPasswordViewModel> {
  const ForgotPasswordView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ForgotPasswordViewModel viewModel,
    Widget? child,
  ) {
    return GameBody(
      body: viewModel.isBusy ? const GameLoading(label: "Sending Reset Link") : SingleChildScrollView(
        child: Column(
          children: [
            GameBar(),
            GameTitleText(text: GameUIText.forgotPassText),
            GameImage(path: GamePng.gameAuthForgotPath),
            SizedBox(
              height: 25,
            ),
            GameTextField(
              controller: viewModel.emailController,
              label: GameUIText.emailText,
            ),
            GameButton(
              text: GameUIText.sentResetPassLinkText,
              onClick: viewModel.forgotPassword,
            ),
          ],
        ),
      ),
    );
  }

  @override
  ForgotPasswordViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ForgotPasswordViewModel();
}
