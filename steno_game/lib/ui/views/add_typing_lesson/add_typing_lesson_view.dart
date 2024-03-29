import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'add_typing_lesson_viewmodel.dart';

class AddTypingLessonView extends StackedView<AddTypingLessonViewModel> {
  const AddTypingLessonView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AddTypingLessonViewModel viewModel,
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
  AddTypingLessonViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AddTypingLessonViewModel();
}
