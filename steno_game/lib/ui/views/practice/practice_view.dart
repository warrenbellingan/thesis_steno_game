import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'practice_viewmodel.dart';

class PracticeView extends StackedView<PracticeViewModel> {
  const PracticeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    PracticeViewModel viewModel,
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
  PracticeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      PracticeViewModel();
}
