import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:steno_game/ui/common/ui_helpers.dart';
import 'package:steno_game/ui/custom_widgets/game_body.dart';
import 'package:steno_game/ui/custom_widgets/game_button.dart';
import 'package:steno_game/ui/custom_widgets/game_loading.dart';
import 'package:steno_game/ui/custom_widgets/game_navigator.dart';
import 'package:steno_game/ui/custom_widgets/game_network_image.dart';
import 'package:steno_game/ui/custom_widgets/game_textfield.dart';
import 'package:steno_game/ui/custom_widgets/painter.dart';
import '../../../model/lesson.dart';
import '../../constants/game_color.dart';
import '../../custom_widgets/game_bar.dart';
import 'add_stroke_lesson_viewmodel.dart';

class AddStrokeLessonView extends StackedView<AddStrokeLessonViewModel> {
  const AddStrokeLessonView(this.lesson, {Key? key}) : super(key: key);

  final Lesson? lesson;
  @override
  Widget builder(
    BuildContext context,
    AddStrokeLessonViewModel viewModel,
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

                            viewModel.lesson != null ?
                            GameButton(
                              text:"Save Lesson",
                              onClick: viewModel.saveLessonClick,
                            ) : GameButton(
                              text: "Add Lesson",
                              onClick: viewModel.addLesson,
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
                              viewModel.currentIndex == viewModel.topics.length
                                  ? Painter(globalKey: viewModel.painterKey)
                                  : Column(
                                    children: [
                                      Container(
                                          decoration: BoxDecoration(
                                              boxShadow: [primaryShadow()],
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              border: Border.all(
                                                  color: Colors.black,
                                                  style: BorderStyle.solid,
                                                  width: 2)),
                                          child: Column(
                                            children: [
                                              GameNetworkImage(
                                                  path: viewModel
                                                      .stroke!.strokeImage),
                                              Text(
                                                viewModel.stroke!.text,
                                                style: const TextStyle(
                                                    fontSize: 24,
                                                    fontWeight: FontWeight.w700,
                                                    letterSpacing: 1,
                                                    wordSpacing: 2),
                                              )
                                            ],
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
                                        child: const Text(
                                          "Edit Stroke",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                              verticalSpaceMedium,
                              if (viewModel.currentIndex ==
                                  viewModel.topics.length)
                                GameTextField(
                                  controller: viewModel.strokeTextController,
                                  label: "Stroke Text",
                                ),
                              GameTextField(
                                  controller:
                                      viewModel.strokeDescriptionController,
                                  label: "Description"),
                              viewModel.currentIndex == viewModel.topics.length
                                  ? GameButton(
                                      text: "Add",
                                      onClick: viewModel.addTopicClick)
                                  : GameButton(
                                      text: "Save",
                                      onClick: viewModel.saveClick,
                                    ),
                            ],
                          ),
                        ),
                      ),
                if (!viewModel.isAddLesson)
                  GameNavigator(
                      previousClick: () => viewModel.changePage(viewModel.currentIndex - 1),
                      nextClick: () => viewModel.changePage(viewModel.currentIndex + 1),
                      currentPage: viewModel.currentIndex + 1,
                      allPage: viewModel.topics.length + 1),
              ],
            ),
    );
  }

  @override
  AddStrokeLessonViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AddStrokeLessonViewModel(lesson);
  @override
  void onViewModelReady(AddStrokeLessonViewModel viewModel) {
    viewModel.init();
  }
}
