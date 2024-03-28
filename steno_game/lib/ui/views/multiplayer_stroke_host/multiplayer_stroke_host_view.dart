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
      child: viewModel.isBusy
          ? const GameLoading()
          : Column(
              children: [
                InGameBar(
                  name: viewModel.user.name,
                  level: 2,
                  isStudent: false,
                ),
                verticalSpaceMedium,

                if (viewModel.gameStatus == 3)
                  Column(
                    children: [
                      if (viewModel.gameType == 0)
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                          child: GameNetworkImage(
                            width: 150,
                            height: 150,
                            path: viewModel.game.stroke,
                          ),
                        ),
                      verticalSpaceSmall,
                      if (viewModel.gameType == 1)
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 6),
                          decoration: BoxDecoration(
                            boxShadow: [primaryShadow()],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text(
                            viewModel.game.text,
                            style: const TextStyle(
                              color: GameColor.primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              letterSpacing: 2,
                              wordSpacing: 3,
                            ),
                          ),
                        ),
                      verticalSpaceSmall,
                      Text(
                        viewModel.game.type == "stroke"
                            ? "Received: ${viewModel.sText.length}/${viewModel.students.length}"
                            : "Received: ${viewModel.sStroke.length}/${viewModel.students.length}",
                        style: const TextStyle(
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
                      if (viewModel.gameType == 0)
                        ListView.builder(
                          itemCount: viewModel.sText.length,
                          shrinkWrap: true,
                          primary: false,
                          itemBuilder: (context, index) {
                            var item = viewModel.sText[index];
                            String? name = viewModel.getStudentName(item.id);
                            return Container(
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
                                    child: Text(
                                      item.text,
                                      style: const TextStyle(
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
                                    name!,
                                    style: const TextStyle(
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
                                        padding: const EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color:
                                              GameColor.primaryBackgroundColor,
                                        ),
                                        child: const Icon(
                                          Icons.check,
                                          color: Colors.green,
                                        ),
                                      ),
                                      horizontalSpaceTiny,
                                      Container(
                                        padding: const EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color:
                                              GameColor.primaryBackgroundColor,
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
                            );
                          },
                        ),
                      if (viewModel.gameType == 1)
                        ListView.builder(
                          itemCount: viewModel.sStroke.length,
                          shrinkWrap: true,
                          primary: false,
                          itemBuilder: (context, index) {
                            var item = viewModel.sStroke[index];
                            String? name = viewModel.getStudentName(item.id);
                            return Container(
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
                                    child: GameNetworkImage(
                                      width: 120,
                                      height: 120,
                                      path: item.imageUrl,
                                    ),
                                  ),
                                  horizontalSpaceSmall,
                                  Column(
                                    children: [
                                      Text(
                                        name!,
                                        style: const TextStyle(
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
                                            padding: const EdgeInsets.all(4),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              color: GameColor
                                                  .primaryBackgroundColor,
                                            ),
                                            child: const Icon(
                                              Icons.check,
                                              color: Colors.green,
                                            ),
                                          ),
                                          horizontalSpaceTiny,
                                          Container(
                                            padding: const EdgeInsets.all(4),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              color: GameColor
                                                  .primaryBackgroundColor,
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
                            );
                          },
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
                            onPressed: viewModel.returnToSelection,
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
                            onPressed: viewModel.returnToSelection,
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
