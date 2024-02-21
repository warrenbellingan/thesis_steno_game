import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'text_exercise_viewmodel.dart';

class TextExerciseView extends StackedView<TextExerciseViewModel> {
  const TextExerciseView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    TextExerciseViewModel viewModel,
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
  TextExerciseViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      TextExerciseViewModel();
}
