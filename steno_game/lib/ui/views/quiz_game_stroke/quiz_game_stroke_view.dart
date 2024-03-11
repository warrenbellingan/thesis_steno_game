import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:steno_game/ui/common/ui_helpers.dart';
import 'package:steno_game/ui/custom_widgets/game_body.dart';
import 'package:steno_game/ui/custom_widgets/game_loading.dart';
import 'package:steno_game/ui/custom_widgets/game_network_image.dart';
import 'package:steno_game/ui/custom_widgets/in_game_bar.dart';

import '../../custom_widgets/game_quiz_choice.dart';
import 'quiz_game_stroke_viewmodel.dart';

class QuizGameStrokeView extends StackedView<QuizGameStrokeViewModel> {
  const QuizGameStrokeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    QuizGameStrokeViewModel viewModel,
    Widget? child,
  ) {
    return GameBody(
        body: SingleChildScrollView(
      child: viewModel.isBusy
          ? GameLoading()
          : Column(
              children: [
                InGameBar(),
                verticalSpaceMedium,
                Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: Colors.black,
                      width: 2,
                      style: BorderStyle.solid,
                    )),
                    child:
                        GameNetworkImage(path: viewModel.stroke.strokeImage)),
                verticalSpaceMedium,
                ListView.builder(
                    itemCount: viewModel.quiz.choices.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      String choiceText = viewModel.quiz.choices[index];
                      return GameQuizChoice(
                        choice: choiceText,
                        onClick: () => viewModel.choiceClick(choiceText),
                      );
                    }),
              ],
            ),
    ));
  }

  @override
  QuizGameStrokeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      QuizGameStrokeViewModel();

  @override
  void onViewModelReady(QuizGameStrokeViewModel viewModel) {
    viewModel.init();
  }
}
