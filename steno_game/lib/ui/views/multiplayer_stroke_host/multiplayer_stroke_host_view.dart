import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'multiplayer_stroke_host_viewmodel.dart';

class MultiplayerStrokeHostView
    extends StackedView<MultiplayerStrokeHostViewModel> {
  const MultiplayerStrokeHostView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    MultiplayerStrokeHostViewModel viewModel,
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
  MultiplayerStrokeHostViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      MultiplayerStrokeHostViewModel();
}
