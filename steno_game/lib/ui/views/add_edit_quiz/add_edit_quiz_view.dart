import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'add_edit_quiz_viewmodel.dart';

class AddEditQuizView extends StackedView<AddEditQuizViewModel> {
  const AddEditQuizView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AddEditQuizViewModel viewModel,
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
  AddEditQuizViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AddEditQuizViewModel();
}
