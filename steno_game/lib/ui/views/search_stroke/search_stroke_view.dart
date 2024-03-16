import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'search_stroke_viewmodel.dart';

class SearchStrokeView extends StackedView<SearchStrokeViewModel> {
  const SearchStrokeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SearchStrokeViewModel viewModel,
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
  SearchStrokeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SearchStrokeViewModel();
}
