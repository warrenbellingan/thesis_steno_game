import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'picture_topic_viewmodel.dart';

class PictureTopicView extends StackedView<PictureTopicViewModel> {
  const PictureTopicView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    PictureTopicViewModel viewModel,
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
  PictureTopicViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      PictureTopicViewModel();
}
