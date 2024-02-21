import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'achievement_viewmodel.dart';

class AchievementView extends StackedView<AchievementViewModel> {
  const AchievementView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AchievementViewModel viewModel,
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
  AchievementViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AchievementViewModel();
}
