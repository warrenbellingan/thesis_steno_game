import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:steno_game/ui/common/ui_helpers.dart';
import 'package:steno_game/ui/custom_widgets/dialog_bar.dart';
import 'package:steno_game/ui/custom_widgets/game_button.dart';
import 'package:steno_game/ui/custom_widgets/game_loading.dart';
import 'package:steno_game/ui/custom_widgets/game_password_text_field.dart';

import 'update_password_dialog_model.dart';

class UpdatePasswordDialog extends StackedView<UpdatePasswordDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const UpdatePasswordDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    UpdatePasswordDialogModel viewModel,
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
                  title: "Change Password",
                ),
                verticalSpaceMedium,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    children: [
                      GamePasswordTextField(
                        controller: viewModel.currentPasswordController,
                        label: "Current Password",
                      ),
                      GamePasswordTextField(
                        controller: viewModel.newPasswordController,
                        label: "New Password",
                      ),
                    ],
                  ),
                ),
                verticalSpaceSmall,
                GameButton(
                  text: "Update",
                  onClick: viewModel.changePassword,
                  isLoading: viewModel.busy("changePassword"),
                ),
                verticalSpaceMedium,
              ],
            ),
    );
  }

  @override
  UpdatePasswordDialogModel viewModelBuilder(BuildContext context) =>
      UpdatePasswordDialogModel();
}
