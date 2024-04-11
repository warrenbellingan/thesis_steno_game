import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:steno_game/ui/common/ui_helpers.dart';
import 'package:steno_game/ui/custom_widgets/game_body.dart';
import 'package:steno_game/ui/custom_widgets/game_button.dart';
import 'package:steno_game/ui/custom_widgets/game_loading.dart';
import 'package:steno_game/ui/custom_widgets/game_navigator.dart';
import 'package:steno_game/ui/custom_widgets/game_textfield.dart';
import 'package:steno_game/ui/custom_widgets/painter.dart';
import 'package:steno_game/ui/custom_widgets/stroke_image.dart';
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
                            viewModel.lesson != null
                                ? GameButton(
                                    text: "Update Lesson",
                                    onClick: viewModel.saveLessonClick,
                                    isLoading: viewModel.busy("saveLesson"),
                                  )
                                : GameButton(
                                    text: "Add Lesson",
                                    onClick: viewModel.addLesson,
                                    isLoading: viewModel.busy("addLesson"),
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
                                        StrokeImage(
                                          imagePath:
                                              viewModel.stroke!.strokeImage,
                                          word: viewModel.stroke!.text,
                                          isOnline: true,
                                        ),
                                        ElevatedButton(
                                          onPressed: viewModel.editStroke,
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  side: const BorderSide(
                                                      color: Colors.black,
                                                      width: 2))),
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
                                  label: "Word/Phrase",
                                ),
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

                                  controller:
                                      viewModel.strokeDescriptionController,
                                  decoration: InputDecoration(
                                    fillColor: GameColor.primaryBackgroundColor,
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    floatingLabelStyle: const TextStyle(
                                      color: GameColor.primaryColor,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    labelText: "Description",
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
                                      onClick: viewModel.addTopicClick,
                                      isLoading: viewModel.busy("addTopic"),
                                    )
                                  : GameButton(
                                      text: "Update",
                                      onClick: viewModel.saveClick,
                                      isLoading: viewModel.busy("save"),
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
  AddStrokeLessonViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AddStrokeLessonViewModel(lesson);
  @override
  void onViewModelReady(AddStrokeLessonViewModel viewModel) {
    viewModel.init();
  }
}
