import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';
import 'package:steno_game/ui/common/ui_helpers.dart';
import 'package:steno_game/ui/constants/game_color.dart';
import 'package:steno_game/ui/custom_widgets/game_bar.dart';
import 'package:steno_game/ui/custom_widgets/game_body.dart';
import 'package:steno_game/ui/custom_widgets/game_button.dart';
import 'package:steno_game/ui/custom_widgets/game_loading.dart';
import 'package:steno_game/ui/custom_widgets/game_navigator.dart';
import 'package:steno_game/ui/custom_widgets/game_network_image.dart';
import 'package:steno_game/ui/custom_widgets/game_textfield.dart';
import 'package:steno_game/ui/custom_widgets/painter.dart';

import '../../../model/quizzes.dart';
import 'add_edit_quiz_viewmodel.dart';

class AddEditQuizView extends StackedView<AddEditQuizViewModel> {
  const AddEditQuizView(this.quizzes, {Key? key}) : super(key: key);

  final Quizzes? quizzes;

  @override
  Widget builder(
    BuildContext context,
    AddEditQuizViewModel viewModel,
    Widget? child,
  ) {
    return GameBody(
      body: viewModel.isBusy
          ? const GameLoading()
          : Column(
              children: [
                GameBar(),
                viewModel.isEditing
                    ? Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              viewModel.currentPage == viewModel.quiz.length
                                  ? Painter(globalKey: viewModel.painterKey)
                                  : Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.black,
                                          width: 2,
                                        ),
                                      ),
                                      child: Stack(
                                        alignment: Alignment.topRight,
                                        children: [
                                          GameNetworkImage(
                                              path: viewModel
                                                  .stroke!.strokeImage),
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              color: Colors.grey,
                                            ),
                                            child: IconButton(
                                              onPressed: viewModel.editStroke,
                                              icon: const Icon(
                                                Icons.edit,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                              verticalSpaceSmall,
                              GameTextField(
                                  controller: viewModel.correctTextController,
                                  label: "Correct answer"),
                              GameTextField(
                                  controller: viewModel.wrong1TextController,
                                  label: "Wrong answer"),
                              GameTextField(
                                  controller: viewModel.wrong2TextController,
                                  label: "Wrong answer"),
                              GameTextField(
                                  controller: viewModel.wrong3TextController,
                                  label: "Wrong answer"),
                              viewModel.currentPage == viewModel.quiz.length
                                  ? GameButton(
                                      text: "Add Quiz",
                                      onClick: viewModel.addQuizzes,
                                      isLoading: viewModel.busy("add"),
                                    )
                                  : GameButton(
                                      text: "Save Quiz",
                                      onClick: viewModel.updateQuizzes,
                                      isLoading: viewModel.busy("add"),),
                            ],
                          ),
                        ),
                      )
                    : SingleChildScrollView(
                        child: Column(
                          children: [
                            GameTextField(
                              controller: viewModel.titleTextController,
                              label: "Quiz Title",
                              icon: const Icon(
                                Icons.title,
                                color: GameColor.primaryColor,
                              ),
                            ),
                            GameButton(
                              text: "Save",
                              onClick: viewModel.addQuiz,
                              isLoading: viewModel.busy("saveQuiz"),
                            ),
                          ],
                        ),
                      ),
                if (viewModel.isEditing)
                  GameNavigator(
                      previousClick: () =>
                          viewModel.changePage(viewModel.currentPage - 1),
                      nextClick: () =>
                          viewModel.changePage(viewModel.currentPage + 1),
                      currentPage: viewModel.currentPage + 1,
                      allPage: viewModel.quiz.length + 1)
              ],
            ),
    );
  }

  @override
  AddEditQuizViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AddEditQuizViewModel(quizzes);

  @override
  void onViewModelReady(AddEditQuizViewModel viewModel) {
    viewModel.init();
  }
}
