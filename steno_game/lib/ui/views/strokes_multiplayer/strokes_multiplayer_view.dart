import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';
import 'package:steno_game/model/multiplayer_stroke.dart';
import 'package:steno_game/ui/common/ui_helpers.dart';
import 'package:steno_game/ui/custom_widgets/game_loading.dart';
import 'package:steno_game/ui/custom_widgets/game_network_image.dart';
import 'package:steno_game/ui/custom_widgets/game_player.dart';
import 'package:steno_game/ui/custom_widgets/game_textfield.dart';
import '../../constants/game_color.dart';
import '../../custom_widgets/game_body.dart';
import '../../custom_widgets/game_button.dart';
import '../../custom_widgets/in_game_bar.dart';
import '../../custom_widgets/painter.dart';
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
      body: SingleChildScrollView(
        child: viewModel.isBusy
            ? const GameLoading()
            : Column(
                children: [
                  InGameBar(
                    name: viewModel.user.name,
                    level: viewModel.user.level,
                    image: viewModel.user.image,
                  ),
                  const SizedBox(height: 24),
                  if (viewModel.gameStatus == 0)
                    Column(
                      children: [
                        Text(
                          viewModel.waitingText,
                          // "Please wait, the game master is checking the answers",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        verticalSpaceSmall,
                        Container(
                          height: screenHeight(context) / 2,
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                              color: GameColor.tertiaryColor,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                  color: GameColor.secondaryColor, width: 2)),
                          child: Column(
                            children: [
                              const Text(
                                "Scores: ",
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
                              Expanded(
                                child: ListView.builder(
                                  itemCount: viewModel.students.length,
                                  shrinkWrap: true,
                                  primary: true,
                                  itemBuilder: (context, index) {
                                    var student = viewModel.students[index];
                                    return GamePlayer(
                                      name: student.name,
                                      imagePath: student.image,
                                      withTail: true,
                                      tailText: student.score.toString(),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        verticalSpaceSmall,
                        viewModel.game.type != ""
                            ? GameButton(
                                text: "Next", onClick: viewModel.nextClick)
                            : const CircularProgressIndicator(),
                      ],
                    ),
                  if (viewModel.gameStatus == 1)
                    Column(
                      children: [
                        const Text(
                          "What stroke is this?",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                            color: Colors.black,
                            width: 2,
                          )),
                          child: GameNetworkImage(
                            width: 250,
                            height: 250,
                            path:
                                "https://firebasestorage.googleapis.com/v0/b/steno-game.appspot.com/o/images%2Fstrokes%2FSample%20Steno%20Image.png?alt=media&token=16fc22b9-2bc7-4721-bcc4-e87b181e14ec",
                          ),
                        ),
                        verticalSpaceMedium,
                        GameTextField(
                          controller: viewModel.textController,
                          label: "Answer",
                          icon: const Icon(
                            Icons.input,
                            color: GameColor.primaryColor,
                          ),
                        ),
                        GameButton(
                          text: "Submit Answer",
                          onClick: () {},
                        ),
                      ],
                    ),
                  if (viewModel.gameStatus == 2)
                    Column(
                      children: [
                        const Text(
                          "Write the stroke for this word/phrase:",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              width: 2,
                              style: BorderStyle.solid,
                              color: GameColor.primaryColor,
                            ),
                          ),
                          child: Text(
                            viewModel.game.text,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 30,
                              color: GameColor.secondaryBackgroundColor,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5,
                            ),
                          ),
                        ),
                        const Divider(
                          thickness: 2,
                          height: 20,
                          color: GameColor.primaryColor,
                        ),
                        Painter(
                          globalKey: viewModel.painterKey,
                        ),
                        verticalSpaceMedium,
                        GameButton(
                            text: "Submit Stroke",
                            onClick: viewModel.submitImage),
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
