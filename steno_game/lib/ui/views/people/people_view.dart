import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'people_viewmodel.dart';

class PeopleView extends StackedView<PeopleViewModel> {
  const PeopleView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    PeopleViewModel viewModel,
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
  PeopleViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      PeopleViewModel();
}
