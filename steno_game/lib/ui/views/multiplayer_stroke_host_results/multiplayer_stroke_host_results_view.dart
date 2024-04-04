import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:steno_game/model/multiplayer_stroke.dart';

import 'multiplayer_stroke_host_results_viewmodel.dart';

class MultiplayerStrokeHostResultsView
    extends StackedView<MultiplayerStrokeHostResultsViewModel> {
  const MultiplayerStrokeHostResultsView(this.game, {Key? key}) : super(key: key);
  final MultiplayerStroke game;
  @override
  Widget builder(
    BuildContext context,
    MultiplayerStrokeHostResultsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      ),
    );
  }

  @override
  MultiplayerStrokeHostResultsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      MultiplayerStrokeHostResultsViewModel(game);
}
