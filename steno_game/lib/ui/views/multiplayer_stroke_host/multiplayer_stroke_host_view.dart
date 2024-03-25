import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:steno_game/model/multiplayer_stroke.dart';
import 'package:steno_game/ui/common/ui_helpers.dart';
import 'package:steno_game/ui/constants/game_color.dart';
import 'package:steno_game/ui/custom_widgets/game_body.dart';
import 'package:steno_game/ui/custom_widgets/game_button.dart';
import 'package:steno_game/ui/custom_widgets/game_loading.dart';
import 'package:steno_game/ui/custom_widgets/game_network_image.dart';
import 'package:steno_game/ui/custom_widgets/game_textfield.dart';
import 'package:steno_game/ui/custom_widgets/in_game_bar.dart';
import 'package:steno_game/ui/custom_widgets/painter.dart';
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
        body: SingleChildScrollView(
      child: viewModel.isBusy ? const GameLoading() : Column(
        children: [
          InGameBar(
            name: "Warren",
            level: 2,
            isStudent: true,
          ),
          verticalSpaceMedium,

          if (viewModel.gameStatus == 3)
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: Colors.black,
                    width: 2,
                  )),
                  child: const GameNetworkImage(
                    width: 150,
                    height: 150,
                    path:
                        "https://firebasestorage.googleapis.com/v0/b/steno-game.appspot.com/o/images%2Fstrokes%2FSample%20Steno%20Image.png?alt=media&token=16fc22b9-2bc7-4721-bcc4-e87b181e14ec",
                  ),
                ),
                verticalSpaceSmall,
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
                  decoration: BoxDecoration(
                    boxShadow: [primaryShadow()],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Text(
                    "Sample Word",
                    style: TextStyle(
                      color: GameColor.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      letterSpacing: 2,
                      wordSpacing: 3,
                    ),
                  ),
                ),
                verticalSpaceSmall,
                const Text(
                  "Received: 9/10",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 18,
                    letterSpacing: 2,
                    wordSpacing: 3,
                  ),
                ),
                verticalSpaceSmall,
                const Divider(
                  color: GameColor.primaryColor,
                  thickness: 3,
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        width: 2,
                        color: GameColor.tertiaryColor,
                      )),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 6),
                        decoration: BoxDecoration(
                          boxShadow: [primaryShadow()],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          "Sample Word",
                          style: TextStyle(
                            color: GameColor.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            letterSpacing: 2,
                            wordSpacing: 3,
                          ),
                        ),
                      ),
                      verticalSpaceSmall,
                      Text(
                        "Warren Bellingan",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          letterSpacing: 2,
                          wordSpacing: 3,
                        ),
                      ),
                      verticalSpaceTiny,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: GameColor.primaryBackgroundColor,
                            ),
                            child: Icon(
                              Icons.check,
                              color: Colors.green,
                            ),
                          ),
                          horizontalSpaceTiny,
                          Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: GameColor.primaryBackgroundColor,
                            ),
                            child: Icon(
                              Icons.cancel_outlined,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        width: 2,
                        color: GameColor.tertiaryColor,
                      )),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: Colors.black,
                          width: 2,
                        )),
                        child: const GameNetworkImage(
                          width: 120,
                          height: 120,
                          path:
                              "https://firebasestorage.googleapis.com/v0/b/steno-game.appspot.com/o/images%2Fstrokes%2FSample%20Steno%20Image.png?alt=media&token=16fc22b9-2bc7-4721-bcc4-e87b181e14ec",
                        ),
                      ),
                      horizontalSpaceSmall,
                      Column(
                        children: [
                          Text(
                            "Warren Bellingan",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              letterSpacing: 2,
                              wordSpacing: 3,
                            ),
                          ),
                          verticalSpaceTiny,
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: GameColor.primaryBackgroundColor,
                                ),
                                child: Icon(
                                  Icons.check,
                                  color: Colors.green,
                                ),
                              ),
                              horizontalSpaceTiny,
                              Container(
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: GameColor.primaryBackgroundColor,
                                ),
                                child: const Icon(
                                  Icons.cancel_outlined,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                verticalSpaceMedium,
                GameButton(text: "Done", onClick: () {}),
              ],
            ),

          //Text
          if (viewModel.gameStatus == 2)
            Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed:viewModel.returnToSelection,
                      icon: const Icon(
                        Icons.arrow_back,
                        color: GameColor.primaryColor,
                        size: 35,
                      ),
                    ),
                  ],
                ),
                const Text(
                  "Write the word or phrase",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 18,
                    letterSpacing: 1,
                    wordSpacing: 3,
                  ),
                ),
                verticalSpaceMedium,
                GameTextField(
                  controller: viewModel.textController,
                  label: "Word/phrase",
                  icon: const Icon(
                    Icons.send,
                    color: GameColor.primaryColor,
                  ),
                ),
                verticalSpaceMedium,
                GameButton(
                  text: "Submit Text",
                  onClick: viewModel.submitTextClick,
                ),
              ],
            ),

          //Stroke
          if (viewModel.gameStatus == 1)
            Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed:viewModel.returnToSelection,
                      icon: const Icon(
                        Icons.arrow_back,
                        color: GameColor.primaryColor,
                        size: 35,
                      ),
                    ),
                  ],
                ),
                const Text(
                  "Please write the shorthand stroke",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 18,
                    letterSpacing: 1,
                    wordSpacing: 3,
                  ),
                ),
                verticalSpaceMedium,
                GameTextField(
                  controller: viewModel.strokeController,
                  label: "Word/phrase",
                  icon: const Icon(
                    Icons.send,
                    color: GameColor.primaryColor,
                  ),
                ),
                verticalSpaceSmall,
                Painter(globalKey: viewModel.painterKey),
                verticalSpaceMedium,
                GameButton(
                  text: "Submit Stroke",
                  onClick: viewModel.submitStrokeClick,
                ),
              ],
            ),

          //Select Mode
          if (viewModel.gameStatus == 0)
            Column(
              children: [
                const Text(
                  "SELECT MODE",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                    wordSpacing: 3,
                  ),
                ),
                verticalSpaceMedium,
                GameButton(
                  text: "STROKE",
                  onClick: () {
                    viewModel.selectionClick(1);
                  },
                ),
                verticalSpaceSmall,
                GameButton(
                  text: "TEXT",
                  onClick: () {
                    viewModel.selectionClick(2);
                  },
                ),
              ],
            ),
        ],
      ),
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
