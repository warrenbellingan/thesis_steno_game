import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'stroke_exercise_viewmodel.dart';

class StrokeExerciseView extends StackedView<StrokeExerciseViewModel> {
  const StrokeExerciseView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    StrokeExerciseViewModel viewModel,
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
  StrokeExerciseViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      StrokeExerciseViewModel();
}
