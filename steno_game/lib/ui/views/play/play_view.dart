import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'play_viewmodel.dart';

class PlayView extends StackedView<PlayViewModel> {
  const PlayView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    PlayViewModel viewModel,
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
  PlayViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      PlayViewModel();
}
