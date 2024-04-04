import 'package:flutter/material.dart';
import 'package:steno_game/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../custom_widgets/dialog_bar.dart';
import '../../custom_widgets/game_button.dart';
import '../../custom_widgets/game_loading.dart';
import 'add_lesson_dialog_model.dart';

class AddLessonDialog extends StackedView<AddLessonDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const AddLessonDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AddLessonDialogModel viewModel,
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
                    title: "Add Lesson",
                  ),
                  verticalSpaceMedium,
                  GameButton(
                    text: "Stroke",
                    onClick: viewModel.goToAddStrokeLesson, isLoading: false,
                  ),
                  verticalSpaceMedium,
                  GameButton(
                      text: "Typing", onClick: viewModel.goToAddTypingLesson, isLoading: false,),
                  verticalSpaceMedium,
                ],
              ),
            ),
    );
  }

  @override
  AddLessonDialogModel viewModelBuilder(BuildContext context) =>
      AddLessonDialogModel();
}
