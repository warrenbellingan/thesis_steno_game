import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'person_viewmodel.dart';

class PersonView extends StackedView<PersonViewModel> {
  const PersonView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    PersonViewModel viewModel,
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
  PersonViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      PersonViewModel();
}
