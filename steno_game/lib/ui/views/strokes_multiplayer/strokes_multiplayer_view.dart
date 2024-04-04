import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';
import 'package:steno_game/model/multiplayer_stroke.dart';
import 'package:steno_game/ui/common/ui_helpers.dart';
import 'package:steno_game/ui/custom_widgets/game_button.dart';
import 'package:steno_game/ui/custom_widgets/game_empty.dart';
import 'package:steno_game/ui/custom_widgets/game_loading.dart';
import 'package:steno_game/ui/custom_widgets/game_navigator.dart';
import 'package:steno_game/ui/custom_widgets/game_network_image.dart';
import 'package:steno_game/ui/custom_widgets/game_textfield.dart';
import 'package:steno_game/ui/custom_widgets/in_game_bar.dart';
import 'package:steno_game/ui/custom_widgets/painter.dart';
import '../../constants/game_color.dart';
import '../../custom_widgets/game_body.dart';
import '../../custom_widgets/game_player.dart';
import 'strokes_multiplayer_viewmodel.dart';

class StrokesMultiplayerView extends StackedView<StrokesMultiplayerViewModel> {
  const StrokesMultiplayerView(this.game, {Key? key}) : super(key: key);

  final MultiplayerStroke game;

  @override
  Widget builder(
    BuildContext context,
    StrokesMultiplayerViewModel viewModel,
    Widget? child,
  ) {
    return GameBody(
      body: viewModel.isBusy
          ? const GameLoading()
          : SingleChildScrollView(
              child: Column(
                children: [
                  InGameBar(name: viewModel.user.name),
                  verticalSpaceMedium,
                  viewModel.questions.isEmpty
                      ? const GameEmpty()
                      : viewModel.currentIndex == viewModel.questions.length
                          ? Column(
                              children: [
                                const Text(
                                  "Done Answering!",
                                  style: TextStyle(
                                    color: GameColor.secondaryBackgroundColor,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 1.5,
                                    wordSpacing: 4,
                                  ),
                                ),
                                verticalSpaceSmall,
                                Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                      color: GameColor.tertiaryColor,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                          color: GameColor.secondaryColor,
                                          width: 2)),
                                  child: Column(
                                    children: [
                                      const Text(
                                        "Scores:",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1.8,
                                        ),
                                      ),
                                      const Divider(
                                        color: Colors.white,
                                        thickness: 2,
                                      ),
                                      verticalSpaceSmall,
                                      viewModel.students.isNotEmpty
                                          ? ListView.builder(
                                              itemCount:
                                                  viewModel.students.length,
                                              shrinkWrap: true,
                                              itemBuilder: (context, index) {
                                                var student =
                                                    viewModel.students[index];
                                                return GamePlayer(
                                                  name: student.name,
                                                  imagePath: student.image,
                                                  withTail: true,
                                                  tailText:
                                                      "Scores: ${viewModel.students[0].score}",
                                                );
                                              })
                                          : const Text(
                                              "No Students found",
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                    ],
                                  ),
                                ),
                                verticalSpaceSmall,
                                GameButton(text: "Exit", onClick: () {}, isLoading: false,)
                              ],
                            )
                          : viewModel.questions[viewModel.currentIndex].type ==
                                  "stroke"
                              ? Column(
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
                                        "${viewModel.currentIndex + 1}",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                    const Text(
                                      "Write the word for this stroke",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black38,
                                        fontWeight: FontWeight.w700,
                                        letterSpacing: 1,
                                        wordSpacing: 3,
                                      ),
                                    ),
                                    GameNetworkImage(
                                        path: viewModel
                                            .questions[viewModel.currentIndex]
                                            .data),
                                    GameTextField(
                                        controller: viewModel.answerController,
                                        label: "Answer"),
                                    GameButton(
                                        text: "Next",
                                        onClick: viewModel.addTextAnswer, isLoading: viewModel.busy("addText"),),
                                  ],
                                )
                              : Column(
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
                                        "${viewModel.currentIndex + 1}",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                    const Text(
                                      "Write the Stroke for this word",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black38,
                                        fontWeight: FontWeight.w700,
                                        letterSpacing: 1,
                                        wordSpacing: 3,
                                      ),
                                    ),
                                    verticalSpaceSmall,
                                    Container(
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
                                        viewModel
                                            .questions[viewModel.currentIndex]
                                            .data,
                                        style: const TextStyle(
                                          color: GameColor.primaryColor,
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 3,
                                        ),
                                      ),
                                    ),
                                    verticalSpaceSmall,
                                    Painter(
                                      globalKey: viewModel.painterKey,
                                    ),
                                    verticalSpaceSmall,
                                    GameButton(
                                        text: "Next",
                                        onClick: viewModel.addStrokeAnswer, isLoading: viewModel.busy("addStroke"),),
                                  ],
                                ),
                ],
              ),
            ),
    );
  }

  @override
  StrokesMultiplayerViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      StrokesMultiplayerViewModel(game);

  @override
  void onViewModelReady(StrokesMultiplayerViewModel viewModel) {
    viewModel.init();
  }
}
