import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:steno_game/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:steno_game/ui/constants/game_color.dart';
import 'package:steno_game/ui/custom_widgets/dialog_bar.dart';
import 'package:steno_game/ui/custom_widgets/game_button.dart';
import 'package:steno_game/ui/custom_widgets/game_loading.dart';
import 'package:steno_game/ui/custom_widgets/game_textfield.dart';

import 'update_name_dialog_model.dart';

class UpdateNameDialog extends StackedView<UpdateNameDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const UpdateNameDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    UpdateNameDialogModel viewModel,
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
                  title: "Change Your Name",
                ),
                verticalSpaceMedium,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: GameTextField(
                    controller: viewModel.nameTextController,
                    label: "Enter your new name",
                    icon: const Icon(
                      Icons.person,
                      color: GameColor.primaryColor,
                    ),
                  ),
                ),
                GameButton(
                  text: "Update",
                  onClick: viewModel.updateName,
                  isLoading: viewModel.busy("update"),
                ),
                verticalSpaceMedium,
              ],
            ),
    );
  }

  @override
  UpdateNameDialogModel viewModelBuilder(BuildContext context) =>
      UpdateNameDialogModel();

  @override
  void onViewModelReady(UpdateNameDialogModel viewModel) {
    viewModel.init();
  }
}
