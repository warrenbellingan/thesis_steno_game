import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:steno_game/ui/common/ui_helpers.dart';
import 'package:steno_game/ui/custom_widgets/game_body.dart';
import 'package:steno_game/ui/custom_widgets/game_loading.dart';
import 'package:steno_game/ui/custom_widgets/game_network_image.dart';
import 'package:steno_game/ui/custom_widgets/in_game_bar.dart';

import '../../custom_widgets/game_quiz_choice.dart';
import 'quiz_game_stroke_viewmodel.dart';

class QuizGameStrokeView extends StackedView<QuizGameStrokeViewModel> {
  const QuizGameStrokeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    QuizGameStrokeViewModel viewModel,
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
  QuizGameStrokeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      QuizGameStrokeViewModel();

  @override
  void onViewModelReady(QuizGameStrokeViewModel viewModel) {
    // viewModel.init();
  }
}
