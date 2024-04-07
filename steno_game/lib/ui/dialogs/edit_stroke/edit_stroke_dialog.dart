import 'package:flutter/material.dart';
import 'package:steno_game/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:steno_game/ui/constants/game_color.dart';
import 'package:steno_game/ui/custom_widgets/game_network_image.dart';
import 'package:steno_game/ui/custom_widgets/game_textfield.dart';
import 'package:steno_game/ui/custom_widgets/painter.dart';
import '../../custom_widgets/dialog_bar.dart';
import '../../custom_widgets/game_button.dart';
import '../../custom_widgets/game_loading.dart';
import 'edit_stroke_dialog_model.dart';

class EditStrokeDialog extends StackedView<EditStrokeDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const EditStrokeDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    EditStrokeDialogModel viewModel,
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
                    title: "Edit Stroke",
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
                  viewModel.isStrokeEdit
                      ? Painter(globalKey: viewModel.painterKey)
                      : Container(
                          width: 250,
                          height: 250,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.black, width: 2)),
                          child: GameNetworkImage(
                            path: viewModel.stroke!.strokeImage,
                          ),
                        ),
                  ElevatedButton(
                    onPressed: viewModel.editStroke,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: const BorderSide(
                                color: Colors.black, width: 2))),
                    child: Text(
                      viewModel.isStrokeEdit ? "Cancel" : "Change Stroke",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  verticalSpaceMedium,
                  GameButton(
                    text: "Save",
                    onClick: viewModel.saveClick,
                    isLoading: viewModel.busy("save"),
                  ),
                  verticalSpaceMedium,
                ],
              ),
            ),
    );
  }

  @override
  EditStrokeDialogModel viewModelBuilder(BuildContext context) =>
      EditStrokeDialogModel();
  @override
  void onViewModelReady(EditStrokeDialogModel viewModel) {
    viewModel.init();
  }
}
