import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:steno_game/ui/common/ui_helpers.dart';
import 'package:steno_game/ui/constants/game_color.dart';
import 'package:steno_game/ui/custom_widgets/game_body.dart';
import 'package:steno_game/ui/custom_widgets/game_button.dart';
import 'package:steno_game/ui/custom_widgets/game_empty.dart';
import 'package:steno_game/ui/custom_widgets/game_loading.dart';
import 'package:steno_game/ui/custom_widgets/game_network_image.dart';
import 'package:steno_game/ui/custom_widgets/in_game_bar.dart';
import '../../../model/quizzes.dart';
import 'quiz_viewmodel.dart';

class QuizView extends StackedView<QuizViewModel> {
  const QuizView(this.game, {Key? key}) : super(key: key);

  final Quizzes game;

  @override
  Widget builder(
    BuildContext context,
    QuizViewModel viewModel,
    Widget? child,
  ) {
    return GameBody(
      body: viewModel.isBusy
          ? const GameLoading()
          : Column(
              children: [
                InGameBar(
                  name: viewModel.user!.name,
                  image: viewModel.user!.image,
                ),
                verticalSpaceSmall,
                viewModel.quizzes.isEmpty
                    ? const GameEmpty()
                    : viewModel.doneGame
                        ? Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [primaryShadow()],
                            ),
                            child: Column(
                              children: [
                                Text(
                                  textAlign: TextAlign.center,
                                  viewModel.correctAnswer ==
                                          viewModel.quizzes.length
                                      ? "Your Great!"
                                      : "Do Your Best Next Time!",
                                  style: const TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 2,
                                    wordSpacing: 3,
                                  ),
                                ),
                                Text(
                                  "Your Score : ${viewModel.score}!",
                                  style: const TextStyle(
                                    fontSize: 24,
                                    color: GameColor.secondaryBackgroundColor,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 2,
                                    wordSpacing: 3,
                                  ),
                                ),
                                Text(
                                  "Correct : ${viewModel.correctAnswer}/${viewModel.quizzes.length}",
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: GameColor.primaryColor,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 2,
                                    wordSpacing: 3,
                                  ),
                                ),
                                GameButton(
                                    text: "Exit",
                                    onClick: viewModel.back,
                                    isLoading: false),
                              ],
                            ),
                          )
                        : Expanded(
                            child: Column(
                              children: [
                                Text(
                                  "${viewModel.currentIndex + 1}/${viewModel.quizzes.length}",
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 2,
                                  ),
                                ),
                                const Text(
                                  "What is this stroke?",
                                  style: TextStyle(
                                    color: GameColor.secondaryBackgroundColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 2,
                                  ),
                                ),
                                verticalSpaceSmall,
                                GameNetworkImage(
                                    path: viewModel.stroke!.strokeImage),
                                verticalSpaceMedium,
                                const Text(
                                  "Choices:",
                                  style: TextStyle(
                                    color: GameColor.primaryColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 2,
                                  ),
                                ),
                                Expanded(
                                  child: ListView.builder(
                                    itemCount: viewModel
                                        .quizzes[viewModel.currentIndex]
                                        .choices
                                        .length,
                                    itemBuilder: (context, index) {
                                      var choice = viewModel
                                          .quizzes[viewModel.currentIndex]
                                          .choices[index];
                                      return GestureDetector(
                                        onTap: () => viewModel.answer(choice),
                                        child: Container(
                                          alignment: Alignment.center,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 12, vertical: 8),
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 12, vertical: 4),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                              color: Colors.black,
                                              width: 2,
                                            ),
                                            borderRadius:
                                                BorderRadiusDirectional
                                                    .circular(30),
                                          ),
                                          child: Text(
                                            choice,
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 1.5,
                                              wordSpacing: 2.5,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                verticalSpaceSmall,
                              ],
                            ),
                          ),
              ],
            ),
    );
  }

  @override
  QuizViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      QuizViewModel(game);

  @override
  void onViewModelReady(QuizViewModel viewModel) {
    viewModel.init();
  }
}
