import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'typing_play_viewmodel.dart';

class TypingPlayView extends StackedView<TypingPlayViewModel> {
  const TypingPlayView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    TypingPlayViewModel viewModel,
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
  TypingPlayViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      TypingPlayViewModel();
}
