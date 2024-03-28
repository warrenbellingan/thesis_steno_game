import 'package:flutter/material.dart';
import 'package:steno_game/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../constants/game_color.dart';
import '../../custom_widgets/dialog_bar.dart';
import '../../custom_widgets/game_button.dart';
import '../../custom_widgets/game_loading.dart';
import '../../custom_widgets/game_textfield.dart';
import 'add_typing_dialog_model.dart';

const double _graphicSize = 60;

class AddTypingDialog extends StackedView<AddTypingDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const AddTypingDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AddTypingDialogModel viewModel,
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
                  GameButton(text: "Add", onClick: viewModel.addClick),
                  verticalSpaceMedium,
                ],
              ),
            ),
    );
  }

  @override
  AddTypingDialogModel viewModelBuilder(BuildContext context) =>
      AddTypingDialogModel();
}
