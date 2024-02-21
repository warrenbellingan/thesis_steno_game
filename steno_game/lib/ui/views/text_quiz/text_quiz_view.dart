import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'text_quiz_viewmodel.dart';

class TextQuizView extends StackedView<TextQuizViewModel> {
  const TextQuizView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    TextQuizViewModel viewModel,
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
  TextQuizViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      TextQuizViewModel();
}
