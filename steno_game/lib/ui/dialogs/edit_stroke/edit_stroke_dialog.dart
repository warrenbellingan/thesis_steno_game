import 'package:flutter/material.dart';
import 'package:steno_game/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
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
          ? GameLoading()
          : Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DialogBar(
            onClick: () => completer(DialogResponse(confirmed: true)),
            title: "Change Your Name",
          ),
          verticalSpaceMedium,

          GameButton(text: "Save", onClick:(){}),
          verticalSpaceMedium,
        ],
      ),
    );
  }

  @override
  EditStrokeDialogModel viewModelBuilder(BuildContext context) =>
      EditStrokeDialogModel();
}
