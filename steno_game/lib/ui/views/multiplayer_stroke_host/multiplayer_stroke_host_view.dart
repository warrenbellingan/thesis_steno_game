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
