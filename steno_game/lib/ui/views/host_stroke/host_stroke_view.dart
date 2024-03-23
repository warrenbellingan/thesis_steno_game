import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'host_stroke_viewmodel.dart';

class HostStrokeView extends StackedView<HostStrokeViewModel> {
  const HostStrokeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HostStrokeViewModel viewModel,
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
  HostStrokeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HostStrokeViewModel();
}
