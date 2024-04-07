import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';
import 'package:steno_game/model/multiplayer_stroke.dart';
import 'package:steno_game/ui/common/ui_helpers.dart';
import 'package:steno_game/ui/constants/game_color.dart';
import 'package:steno_game/ui/custom_widgets/game_bar.dart';
import 'package:steno_game/ui/custom_widgets/game_body.dart';
import 'package:steno_game/ui/custom_widgets/game_button.dart';
import 'package:steno_game/ui/custom_widgets/game_loading.dart';
import 'package:steno_game/ui/custom_widgets/game_network_image.dart';
import 'package:steno_game/ui/custom_widgets/game_player.dart';
import 'multiplayer_stroke_host_viewmodel.dart';

class MultiplayerStrokeHostView
    extends StackedView<MultiplayerStrokeHostViewModel> {
  const MultiplayerStrokeHostView(this.game, {Key? key}) : super(key: key);

  final MultiplayerStroke game;

  @override
  Widget builder(
    BuildContext context,
    MultiplayerStrokeHostViewModel viewModel,
    Widget? child,
  ) {
    return GameBody(
        body: viewModel.isBusy
            ? const GameLoading()
            : Column(
                children: [
                  GameBar(),
                  Expanded(
                    child: ListView.builder(
                      itemCount: viewModel.questions.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        var question = viewModel.questions[index];
                        var answers = viewModel.findQuestionAnswer(question.id);
                        return Container(
                          margin: const EdgeInsets.only(bottom: 24),
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [primaryShadow()],
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.black, width: 3),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 3),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(50),
                                      border: Border.all(
                                        color: GameColor.primaryColor,
                                        width: 3,
                                      ),
                                    ),
                                    child: Text(
                                      "${index + 1}",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                  horizontalSpaceSmall,
                                  Expanded(
                                    child: Text(
                                      question.type == "stroke"
                                          ? "What is this stroke?"
                                          : "What is the Stroke of this word?",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        wordSpacing: 2,
                                        letterSpacing: 1,
                                        fontSize: 20,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              question.type == "stroke"
                                  ? Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.black, width: 2)),
                                      child: GameNetworkImage(
                                        path: question.data,
                                        size: screenWidthFraction(context,
                                            dividedBy: 2),
                                      ),
                                    )
                                  : Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(50),
                                        boxShadow: [primaryShadow()],
                                        border: Border.all(
                                            color: GameColor.primaryColor,
                                            width: 2),
                                      ),
                                      child: Text(
                                        question.data,
                                        style: const TextStyle(
                                          color: GameColor.primaryColor,
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 3,
                                        ),
                                      ),
                                    ),
                              Container(
                                margin: const EdgeInsets.symmetric(vertical: 6),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4),
                                alignment: Alignment.center,
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                  color: GameColor.secondaryBackgroundColor,
                                ),
                                child: Text(
                                  "ANSWERS: ${answers.length}/${viewModel.students.length}",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 3,
                                  ),
                                ),
                              ),
                              ListView.builder(
                                  itemCount: answers.length,
                                  shrinkWrap: true,
                                  primary: false,
                                  itemBuilder: (context, index) {
                                    var answer = answers[index];
                                    var student =
                                        viewModel.getPlayer(answer.userId);
                                    return Container(
                                      margin: const EdgeInsets.all(12),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 4),
                                      decoration: BoxDecoration(
                                          boxShadow: [primaryShadow()],
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadiusDirectional.circular(
                                                  20),
                                          border: Border.all(
                                              color: GameColor.tertiaryColor,
                                              width: 2)),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8,
                                                        vertical: 3),
                                                decoration: BoxDecoration(
                                                  color: GameColor
                                                      .secondaryBackgroundColor,
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                ),
                                                child: Text(
                                                  "${index + 1}",
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ),
                                              horizontalSpaceSmall,
                                              Expanded(
                                                child: GamePlayer(
                                                  name: student.name,
                                                  withTail: false,
                                                  imagePath: student.image,
                                                ),
                                              ),
                                            ],
                                          ),
                                          question.type == "stroke"
                                              ? Container(
                                                  padding:
                                                      const EdgeInsets.all(8),
                                                  decoration: BoxDecoration(
                                                    color: GameColor
                                                        .secondaryBackgroundColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    boxShadow: [
                                                      primaryShadow()
                                                    ],
                                                  ),
                                                  child: Text(
                                                    answer.data,
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      letterSpacing: 3,
                                                    ),
                                                  ),
                                                )
                                              : Container(
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.grey,
                                                          width: 2)),
                                                  child: GameNetworkImage(
                                                    path: answer.data,
                                                    size: screenWidthFraction(
                                                        context,
                                                        dividedBy: 2),
                                                  ),
                                                ),
                                          verticalSpaceSmall,
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              InkWell(
                                                onTap: () =>
                                                    viewModel.addCorrectAnswers(
                                                        answer.id),
                                                child: AbsorbPointer(
                                                  child: Container(
                                                    padding:
                                                        const EdgeInsets.all(2),
                                                    decoration: BoxDecoration(
                                                        boxShadow: [
                                                          primaryShadow()
                                                        ],
                                                        border: Border.all(
                                                            color: Colors.green,
                                                            width: 2),
                                                        color:
                                                            viewModel.isCorrect(
                                                                    answer.id)
                                                                ? Colors.green
                                                                : Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(40)),
                                                    child: Icon(
                                                        size: 30,
                                                        color:
                                                            viewModel.isCorrect(
                                                                    answer.id)
                                                                ? Colors.white
                                                                : Colors.green,
                                                        Icons.check_rounded),
                                                  ),
                                                ),
                                              ),
                                              horizontalSpaceMedium,
                                              InkWell(
                                                onTap: () => viewModel
                                                    .addWrongAnswers(answer.id),
                                                child: AbsorbPointer(
                                                  child: Container(
                                                    padding:
                                                        const EdgeInsets.all(2),
                                                    decoration: BoxDecoration(
                                                        boxShadow: [
                                                          primaryShadow()
                                                        ],
                                                        border: Border.all(
                                                            color: Colors.red,
                                                            width: 2),
                                                        color: viewModel
                                                                .isWrong(
                                                                    answer.id)
                                                            ? Colors.redAccent
                                                            : Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(40)),
                                                    child: Icon(
                                                        size: 30,
                                                        color:
                                                            viewModel.isWrong(
                                                                    answer.id)
                                                                ? Colors.white
                                                                : Colors.red,
                                                        Icons.close),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                                  })
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  verticalSpaceSmall,
                  GameButton(
                    text: "Submit",
                    onClick: viewModel.submitAnswers,
                    isLoading: viewModel.busy("submit"),
                  ),
                ],
              ));
  }

  @override
  MultiplayerStrokeHostViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      MultiplayerStrokeHostViewModel(game);

  @override
  void onViewModelReady(MultiplayerStrokeHostViewModel viewModel) {
    viewModel.init();
  }
}
