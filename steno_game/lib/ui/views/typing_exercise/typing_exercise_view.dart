import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'typing_exercise_viewmodel.dart';

class TypingExerciseView extends StackedView<TypingExerciseViewModel> {
  const TypingExerciseView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    TypingExerciseViewModel viewModel,
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
  TypingExerciseViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      TypingExerciseViewModel();
}
