import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:steno_game/model/multiplayer_stroke.dart';
import 'package:steno_game/ui/custom_widgets/game_bar.dart';
import 'package:steno_game/ui/custom_widgets/game_body.dart';
import 'package:steno_game/ui/custom_widgets/game_loading.dart';

import '../../common/ui_helpers.dart';
import '../../constants/game_color.dart';
import '../../custom_widgets/game_button.dart';
import '../../custom_widgets/game_player.dart';
import 'multiplayer_stroke_host_results_viewmodel.dart';

class MultiplayerStrokeHostResultsView
    extends StackedView<MultiplayerStrokeHostResultsViewModel> {
  const MultiplayerStrokeHostResultsView(this.game, {Key? key})
      : super(key: key);
  final MultiplayerStroke game;
  @override
  Widget builder(
    BuildContext context,
    MultiplayerStrokeHostResultsViewModel viewModel,
    Widget? child,
  ) {
    return GameBody(
        body: SingleChildScrollView(
      child: viewModel.isBusy
          ? const GameLoading()
          : Column(
              children: [
                GameBar(),
                Container(
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
                              itemCount: viewModel.students.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                var student = viewModel.students[index];
                                return GamePlayer(
                                  name: student.name,
                                  imagePath: student.image,
                                  withTail: true,
                                  tailText:
                                      "Scores: ${viewModel.students[index].score}",
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
                GameButton(
                  text: "Exit",
                  onClick: viewModel.exit,
                  isLoading: false,
                )
              ],
            ),
    ));
  }

  @override
  MultiplayerStrokeHostResultsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      MultiplayerStrokeHostResultsViewModel(game);
  @override
  void onViewModelReady(MultiplayerStrokeHostResultsViewModel viewModel) {
    viewModel.init();
  }
}
