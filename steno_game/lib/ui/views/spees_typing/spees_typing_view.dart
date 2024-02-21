import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'spees_typing_viewmodel.dart';

class SpeesTypingView extends StackedView<SpeesTypingViewModel> {
  const SpeesTypingView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SpeesTypingViewModel viewModel,
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
  SpeesTypingViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SpeesTypingViewModel();
}
