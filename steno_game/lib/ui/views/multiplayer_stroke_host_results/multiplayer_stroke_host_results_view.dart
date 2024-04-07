import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:steno_game/model/multiplayer_stroke.dart';
import 'package:steno_game/ui/custom_widgets/game_body.dart';
import 'package:steno_game/ui/custom_widgets/game_loading.dart';

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
          : const Column(
              children: [
                Text("Done"),
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
