import 'package:flutter/material.dart';
import 'package:steno_game/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../constants/game_color.dart';
import '../../custom_widgets/dialog_bar.dart';
import '../../custom_widgets/game_button.dart';
import '../../custom_widgets/game_loading.dart';
import '../../custom_widgets/game_textfield.dart';
import 'edit_typing_dialog_model.dart';

const double _graphicSize = 60;

class EditTypingDialog extends StackedView<EditTypingDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const EditTypingDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    EditTypingDialogModel viewModel,
    Widget? child,
  ) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: Colors.white,
      child: viewModel.isBusy
          ? const GameLoading()
          : SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DialogBar(
              onClick: () => completer(DialogResponse(confirmed: true)),
              title: "Add",
            ),
            verticalSpaceMedium,
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12),
              child: GameTextField(
                controller: viewModel.textController,
                label: "Text",
                icon: const Icon(
                  Icons.input,
                  color: GameColor.primaryColor,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12),
              child: GameTextField(
                controller: viewModel.typingKeysController,
                label: "Typing Keys",
                icon: const Icon(
                  Icons.keyboard,
                  color: GameColor.primaryColor,
                ),
              ),
            ),
            verticalSpaceMedium,
            GameButton(text: "Save", onClick: viewModel.editClick),
            verticalSpaceMedium,
          ],
        ),
      ),
    );
  }

  @override
  EditTypingDialogModel viewModelBuilder(BuildContext context) =>
      EditTypingDialogModel();

  @override
  void onViewModelReady(EditTypingDialogModel viewModel) {
    viewModel.init();
  }
}
