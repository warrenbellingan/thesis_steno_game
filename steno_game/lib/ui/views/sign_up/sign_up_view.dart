import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:steno_game/ui/views/sign_up/sign_up_viewmodel.dart';
import '../../../model/user.dart';
import '../../constants/game_color.dart';
import '../../constants/game_ui_png.dart';
import '../../constants/game_ui_text.dart';
import '../../custom_widgets/game_bar.dart';
import '../../custom_widgets/game_body.dart';
import '../../custom_widgets/game_button.dart';
import '../../custom_widgets/game_image.dart';
import '../../custom_widgets/game_loading.dart';
import '../../custom_widgets/game_password_text_field.dart';
import '../../custom_widgets/game_textfield.dart';
import '../../custom_widgets/game_title_text.dart';

class SignUpView extends StackedView<SignUpViewModel> {
  const SignUpView(this.user, {Key? key}) : super(key: key);

  final User? user;

  @override
  Widget builder(
    BuildContext context,
    SignUpViewModel viewModel,
    Widget? child,
  ) {
    return GameBody(
        body: viewModel.isBusy
            ? const GameLoading(
                label: "Creating Account",
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    GameBar(),
                    GameTitleText(
                        text: user == null
                            ? GameUIText.createAccText
                            : "Connect Account"),
                    const GameImage(
                      path: GameUiPng.gameAuthCreatePath,
                      size: 150,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    DropdownMenu(
                      controller: viewModel.roleController,
                      hintText: GameUIText.roleText,
                      menuStyle: const MenuStyle(
                        alignment: Alignment.centerLeft,
                      ),
                      leadingIcon: const Icon(
                        Icons.people_alt,
                        color: GameColor.primaryColor,
                      ),
                      textStyle: const TextStyle(
                        fontSize: 15,
                        color: GameColor.secondaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                      dropdownMenuEntries: [
                        const DropdownMenuEntry(
                          value: 1,
                          label: GameUIText.studentText,
                        ),
                        const DropdownMenuEntry(
                          value: 2,
                          label: GameUIText.instructorText,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    GameTextField(
                      controller: viewModel.nameController,
                      label: GameUIText.nameText,
                      icon: const Icon(
                        Icons.person,
                        color: GameColor.primaryColor,
                      ),
                    ),
                    GameTextField(
                        controller: viewModel.emailController,
                        label: GameUIText.emailText),
                    GamePasswordTextField(
                      controller: viewModel.passwordController,
                      label: GameUIText.passwordText,
                    ),
                    GamePasswordTextField(
                      controller: viewModel.confirmPasswordController,
                      label: GameUIText.confirmPassText,
                    ),
                    GameButton(
                      text: user == null ? GameUIText.createText : "Connect",
                      onClick: viewModel.signUp,
                      isLoading: viewModel.busy("signup"),
                    )
                  ],
                ),
              ));
  }

  @override
  SignUpViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SignUpViewModel(user);

  @override
  void onViewModelReady(SignUpViewModel viewModel) {
    viewModel.init();
  }
}
