import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'strokes_multiplayer_viewmodel.dart';

class StrokesMultiplayerView extends StackedView<StrokesMultiplayerViewModel> {
  const StrokesMultiplayerView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    StrokesMultiplayerViewModel viewModel,
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
  StrokesMultiplayerViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      StrokesMultiplayerViewModel();
}
