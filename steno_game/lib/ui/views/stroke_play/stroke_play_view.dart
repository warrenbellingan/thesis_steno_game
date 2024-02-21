import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'stroke_play_viewmodel.dart';

class StrokePlayView extends StackedView<StrokePlayViewModel> {
  const StrokePlayView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    StrokePlayViewModel viewModel,
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
  StrokePlayViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      StrokePlayViewModel();
}
