import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'search_steno_typing_viewmodel.dart';

class SearchStenoTypingView extends StackedView<SearchStenoTypingViewModel> {
  const SearchStenoTypingView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SearchStenoTypingViewModel viewModel,
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
  SearchStenoTypingViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SearchStenoTypingViewModel();
}
