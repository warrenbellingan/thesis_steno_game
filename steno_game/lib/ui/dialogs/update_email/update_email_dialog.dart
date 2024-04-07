import 'package:flutter/material.dart';
import 'package:steno_game/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:steno_game/ui/custom_widgets/dialog_bar.dart';
import 'package:steno_game/ui/custom_widgets/game_button.dart';
import 'package:steno_game/ui/custom_widgets/game_loading.dart';
import 'package:steno_game/ui/custom_widgets/game_password_text_field.dart';
import 'package:steno_game/ui/custom_widgets/game_textfield.dart';

import 'update_email_dialog_model.dart';

class UpdateEmailDialog extends StackedView<UpdateEmailDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const UpdateEmailDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    UpdateEmailDialogModel viewModel,
    Widget? child,
  ) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: Colors.white,
      child: viewModel.isBusy
          ? GameLoading()
          : Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DialogBar(
                  onClick: () => completer(DialogResponse(confirmed: true)),
                  title: "Change Email",
                ),
                verticalSpaceMedium,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    children: [
                      GameTextField(
                          controller: viewModel.newEmailTextController,
                          label: "New Email"),
                      GamePasswordTextField(
                          controller: viewModel.passwordTextController,
                          label: "Confirm Password"),
                    ],
                  ),
                ),
                GameButton(
                  text: "Save",
                  onClick: viewModel.changeEmail,
                  isLoading: viewModel.busy("changeEmail"),
                ),
                verticalSpaceMedium,
              ],
            ),
    );
  }

  @override
  UpdateEmailDialogModel viewModelBuilder(BuildContext context) =>
      UpdateEmailDialogModel();

  @override
  void onViewModelReady(UpdateEmailDialogModel viewModel) {
    viewModel.init();
  }
}
