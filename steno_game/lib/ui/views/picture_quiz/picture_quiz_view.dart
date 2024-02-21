import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'picture_quiz_viewmodel.dart';

class PictureQuizView extends StackedView<PictureQuizViewModel> {
  const PictureQuizView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    PictureQuizViewModel viewModel,
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
  PictureQuizViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      PictureQuizViewModel();
}
