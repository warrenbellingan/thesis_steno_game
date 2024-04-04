import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:steno_game/model/lesson.dart';

import '../../common/ui_helpers.dart';
import '../../constants/game_color.dart';
import '../../custom_widgets/game_bar.dart';
import '../../custom_widgets/game_body.dart';
import '../../custom_widgets/game_button.dart';
import '../../custom_widgets/game_loading.dart';
import '../../custom_widgets/game_navigator.dart';
import '../../custom_widgets/game_textfield.dart';
import 'add_typing_lesson_viewmodel.dart';

class AddTypingLessonView extends StackedView<AddTypingLessonViewModel> {
  const AddTypingLessonView(this.lesson, {Key? key}) : super(key: key);

  final Lesson? lesson;

  @override
  Widget builder(
    BuildContext context,
    AddTypingLessonViewModel viewModel,
    Widget? child,
  ) {
    return GameBody(
      body: viewModel.isBusy
          ? const GameLoading()
          : Column(
              children: [
                GameBar(),
                viewModel.isAddLesson
                    ? SingleChildScrollView(
                        child: Column(
                          children: [
                            GameTextField(
                              controller: viewModel.lessonTitleController,
                              label: "Lesson Title",
                              icon: const Icon(
                                Icons.title,
                                color: GameColor.primaryColor,
                              ),
                            ),
                            viewModel.lesson != null
                                ? GameButton(
                                    text: "Save Lesson",
                                    onClick: viewModel.saveLessonClick, isLoading: viewModel.busy("saveLesson"),
                                  )
                                : GameButton(
                                    text: "Add Lesson",
                                    onClick: viewModel.addLesson, isLoading: viewModel.busy("addLesson"),
                                  ),
                          ],
                        ),
                      )
                    : Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              if (viewModel.currentIndex ==
                                  viewModel.topics.length)
                                const Text(
                                  "ADD TOPIC",
                                  style: TextStyle(
                                    fontSize: 24,
                                    wordSpacing: 3,
                                    letterSpacing: 2,
                                    color: GameColor.secondaryBackgroundColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              verticalSpaceMedium,
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: [
                                      primaryShadow(),
                                    ]),
                                child: TextField(
                                  maxLines: 15,
                                  textAlign: TextAlign.justify,
                                  keyboardType: TextInputType.multiline,
                                  controller: viewModel.textController,
                                  decoration: InputDecoration(
                                    fillColor: GameColor.primaryBackgroundColor,
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    labelText: "Topic Text",
                                    labelStyle: const TextStyle(
                                      color: Color(0xFF78746D),
                                      fontSize: 35,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                              verticalSpaceMedium,
                              viewModel.currentIndex == viewModel.topics.length
                                  ? GameButton(
                                      text: "Add",
                                      onClick: viewModel.addTopicClick, isLoading: viewModel.busy("addTopic"),)
                                  : GameButton(
                                      text: "Save",
                                      onClick: viewModel.updateTopicClick, isLoading: viewModel.busy("updateTopic"),
                                    ),
                            ],
                          ),
                        ),
                      ),
                if (!viewModel.isAddLesson)
                  GameNavigator(
                      previousClick: () =>
                          viewModel.changePage(viewModel.currentIndex - 1),
                      nextClick: () =>
                          viewModel.changePage(viewModel.currentIndex + 1),
                      currentPage: viewModel.currentIndex + 1,
                      allPage: viewModel.topics.length + 1),
              ],
            ),
    );
  }

  @override
  AddTypingLessonViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AddTypingLessonViewModel(lesson);

  @override
  void onViewModelReady(AddTypingLessonViewModel viewModel) {
    viewModel.init();
  }
}
