import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../constants/game_ui_png.dart';
import '../../constants/game_ui_text.dart';
import '../../custom_widgets/game_body.dart';
import '../../custom_widgets/game_button.dart';
import '../../custom_widgets/game_image.dart';
import '../../custom_widgets/game_loading.dart';
import '../../custom_widgets/game_password_text_field.dart';
import '../../custom_widgets/game_textButton.dart';
import '../../custom_widgets/game_textfield.dart';
import '../../custom_widgets/game_title_text.dart';
import 'login_viewmodel.dart';

class LoginView extends StackedView<LoginViewModel> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    LoginViewModel viewModel,
    Widget? child,
  ) {
    return GameBody(
      body: viewModel.isBusy
          ? const GameLoading(
              label: "Logging In",
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  const GameTitleText(text: GameUIText.welcomeText),
                  const SizedBox(
                    height: 10,
                  ),
                  const GameImage(path: GameUiPng.gameAuthLoginPath),
                  const SizedBox(
                    height: 25,
                  ),
                  GameTextField(
                    controller: viewModel.emailController,
                    label: GameUIText.emailText,
                  ),
                  GamePasswordTextField(
                    controller: viewModel.passwordController,
                    label: GameUIText.passwordText,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GameButton(
                    text: GameUIText.loginText,
                    onClick: viewModel.logIn, isLoading: viewModel.busy("login"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GameTextButton(
                    title: GameUIText.createNewAccText,
                    onClick: viewModel.goToSignUp,
                  ),
                  GameTextButton(
                    title: GameUIText.forgotPassText,
                    onClick: viewModel.goToForgotPassword,
                  ),
                ],
              ),
            ),
    );
  }

  @override
  LoginViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LoginViewModel();
}
