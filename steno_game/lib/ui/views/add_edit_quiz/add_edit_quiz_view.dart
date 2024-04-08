import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';
import 'package:steno_game/ui/constants/game_color.dart';
import 'package:steno_game/ui/custom_widgets/game_bar.dart';
import 'package:steno_game/ui/custom_widgets/game_body.dart';
import 'package:steno_game/ui/custom_widgets/game_button.dart';
import 'package:steno_game/ui/custom_widgets/game_loading.dart';
import 'package:steno_game/ui/custom_widgets/game_navigator.dart';
import 'package:steno_game/ui/custom_widgets/game_textfield.dart';
import 'package:steno_game/ui/custom_widgets/painter.dart';

import 'add_edit_quiz_viewmodel.dart';

class AddEditQuizView extends StackedView<AddEditQuizViewModel> {
  const AddEditQuizView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AddEditQuizViewModel viewModel,
    Widget? child,
  ) {
    return GameBody(
      body: viewModel.isBusy ? const GameLoading() : Column(
        children: [
          GameBar(),
          viewModel.isEditing ? Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Painter(globalKey: viewModel.painterKey),
                  GameTextField(controller: viewModel.correctTextController, label: "Correct answer"),
                ],
              ),
            ),
          ): SingleChildScrollView(
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
          GameNavigator(previousClick: (){}, nextClick: (){}, currentPage: viewModel.currentPage + 1, allPage: viewModel.quiz.length + 1)
        ],
      ),
    );
  }

  @override
  AddEditQuizViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AddEditQuizViewModel();
}
