import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';
import 'package:steno_game/model/multiplayer_stroke.dart';
import 'package:steno_game/ui/custom_widgets/game_loading.dart';
import '../../custom_widgets/game_body.dart';
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

              ),
      ),
    );
  }

  @override
  StrokesMultiplayerViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      StrokesMultiplayerViewModel();

  @override
  void onViewModelReady(StrokesMultiplayerViewModel viewModel) {

  }
}
