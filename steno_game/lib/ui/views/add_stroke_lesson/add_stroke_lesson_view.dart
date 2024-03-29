import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:steno_game/ui/custom_widgets/game_body.dart';
import 'package:steno_game/ui/custom_widgets/game_button.dart';
import 'package:steno_game/ui/custom_widgets/game_loading.dart';
import 'package:steno_game/ui/custom_widgets/game_textfield.dart';

import '../../constants/game_color.dart';
import '../../custom_widgets/game_bar.dart';
import 'add_stroke_lesson_viewmodel.dart';

class AddStrokeLessonView extends StackedView<AddStrokeLessonViewModel> {
  const AddStrokeLessonView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AddStrokeLessonViewModel viewModel,
    Widget? child,
  ) {
    return GameBody(
        body: SingleChildScrollView(
      child: viewModel.isBusy
          ? const GameLoading()
          : Column(
              children: [
                GameBar(),
                Column(
                  children: [
                    GameTextField(
                      controller: viewModel.lessonTitleController,
                      label: "Lesson Title",
                      icon: const Icon(
                        Icons.title,
                        color: GameColor.primaryColor,
                      ),
                    ),
                    GameButton(text: "Add Lesson", onClick: viewModel.addLesson),
                  ],
                ),
              ],
            ),
    ));
  }

  @override
  AddStrokeLessonViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AddStrokeLessonViewModel();
}
