import 'package:flutter/material.dart';
import 'package:steno_game/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../constants/game_color.dart';
import '../../custom_widgets/dialog_bar.dart';
import '../../custom_widgets/game_button.dart';
import '../../custom_widgets/game_loading.dart';
import '../../custom_widgets/game_textfield.dart';
import '../../custom_widgets/painter.dart';
import 'add_stroke_dialog_model.dart';

const double _graphicSize = 60;

class AddStrokeDialog extends StackedView<AddStrokeDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const AddStrokeDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AddStrokeDialogModel viewModel,
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
                    title: "Add Stroke",
                  ),
                  verticalSpaceMedium,
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 12),
                    child: GameTextField(
                      controller: viewModel.textController,
                      label: "Stroke Text",
                      icon: const Icon(
                        Icons.input,
                        color: GameColor.primaryColor,
                      ),
                    ),
                  ),
                  Painter(globalKey: viewModel.painterKey),
                  verticalSpaceMedium,
                  GameButton(
                    text: "Add",
                    onClick: viewModel.addClick,
                    isLoading: viewModel.busy("add"),
                  ),
                  verticalSpaceMedium,
                ],
              ),
            ),
    );
  }

  @override
  AddStrokeDialogModel viewModelBuilder(BuildContext context) =>
      AddStrokeDialogModel();
}
