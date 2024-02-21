import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'quiz_game_stroke_viewmodel.dart';

class QuizGameStrokeView extends StackedView<QuizGameStrokeViewModel> {
  const QuizGameStrokeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    QuizGameStrokeViewModel viewModel,
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
  QuizGameStrokeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      QuizGameStrokeViewModel();
}
