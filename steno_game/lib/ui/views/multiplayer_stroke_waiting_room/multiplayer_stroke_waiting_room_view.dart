import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';
import 'package:steno_game/model/multiplayer_stroke.dart';
import 'package:steno_game/ui/custom_widgets/game_bar.dart';
import 'package:steno_game/ui/custom_widgets/game_body.dart';
import 'package:steno_game/ui/custom_widgets/game_loading.dart';

import '../../common/ui_helpers.dart';
import '../../constants/game_color.dart';
import '../../custom_widgets/game_button.dart';
import '../../custom_widgets/game_player.dart';
import 'multiplayer_stroke_waiting_room_viewmodel.dart';

class MultiplayerStrokeWaitingRoomView
    extends StackedView<MultiplayerStrokeWaitingRoomViewModel> {
  const MultiplayerStrokeWaitingRoomView(this.game, {Key? key})
      : super(key: key);

  final MultiplayerStroke game;

  @override
  Widget builder(
    BuildContext context,
    MultiplayerStrokeWaitingRoomViewModel viewModel,
    Widget? child,
  ) {
    return GameBody(
      body: viewModel.isBusy
          ? const GameLoading()
          : Column(
              children: [
                GameBar(),
                if (viewModel.isStudent())
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(),
                      ),
                      Text(
                        "... Waiting to start the game ...",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                          wordSpacing: 3,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(),
                      ),
                    ],
                  ),
                verticalSpaceSmall,
                if (!viewModel.isStudent())
                  const Text(
                    "Share this code to your students to join this game",
                    style: TextStyle(
                      color: GameColor.primaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.5,
                      wordSpacing: 3,
                    ),
                  ),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [primaryShadow()],
                    border: Border.all(color: GameColor.primaryColor, width: 2),
                  ),
                  child: Text(
                    viewModel.game.id,
                    style: const TextStyle(
                      color: GameColor.primaryColor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 3,
                    ),
                  ),
                ),
                verticalSpaceSmall,
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  decoration: BoxDecoration(
                    color: GameColor.primaryColor,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [primaryShadow()],
                  ),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Game Master:",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                          wordSpacing: 3,
                        ),
                      ),
                      GamePlayer(
                        name: viewModel.instructor.name,
                        imagePath: viewModel.instructor.image,
                        withTail: false,
                      ),
                    ],
                  ),
                ),
                verticalSpaceMedium,
                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                        color: GameColor.tertiaryColor,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            color: GameColor.secondaryColor, width: 2)),
                    child: Column(
                      children: [
                        Text(
                          "Players: ${viewModel.students.length}",
                          style: const TextStyle(
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
                          child: viewModel.students.isNotEmpty
                              ? ListView.builder(
                                  itemCount: viewModel.students.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    var student = viewModel.students[index];
                                    return GamePlayer(
                                      name: student.name,
                                      imagePath: student.image,
                                      withTail: false,
                                    );
                                  })
                              : const Text(
                                  "Waiting for students to join",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
                verticalSpaceSmall,
                if (!viewModel.isStudent())
                  GameButton(
                    text: "Start Game",
                    onClick: viewModel.startGame,
                    isLoading: viewModel.busy("startGame"),
                  ),
              ],
            ),
    );
  }

  @override
  MultiplayerStrokeWaitingRoomViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      MultiplayerStrokeWaitingRoomViewModel(game);

  @override
  void onViewModelReady(MultiplayerStrokeWaitingRoomViewModel viewModel) {
    viewModel.init();
  }
}
