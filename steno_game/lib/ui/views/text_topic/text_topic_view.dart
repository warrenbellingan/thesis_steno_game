import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'text_topic_viewmodel.dart';

class TextTopicView extends StackedView<TextTopicViewModel> {
  const TextTopicView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    TextTopicViewModel viewModel,
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
  TextTopicViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      TextTopicViewModel();
}
