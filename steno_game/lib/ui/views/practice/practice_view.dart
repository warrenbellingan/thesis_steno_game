import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:steno_game/ui/common/ui_helpers.dart';
import 'package:steno_game/ui/custom_widgets/game_bar.dart';
import 'package:steno_game/ui/custom_widgets/game_body.dart';
import 'package:steno_game/ui/custom_widgets/game_loading.dart';
import 'package:steno_game/ui/custom_widgets/game_search_textfield.dart';
import 'package:steno_game/ui/custom_widgets/painter.dart';
import 'package:steno_game/ui/custom_widgets/stroke_image.dart';

import 'practice_viewmodel.dart';

class PracticeView extends StackedView<PracticeViewModel> {
  const PracticeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    PracticeViewModel viewModel,
    Widget? child,
  ) {
    return GameBody(
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GameBar(),
            GameSearchTextField(
              controller: viewModel.searchController,
              onClick: viewModel.searchStroke,
            ),
            verticalSpaceSmall,
            viewModel.isBusy ? const GameLoading() : Expanded(
              child: ListView.builder(
                itemCount: viewModel.strokes.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final stroke = viewModel.strokes[index];
                  return StrokeImage(
                      imagePath: stroke.strokeImage, word: stroke.text, size: 200,);
                },
              ),
            ),
            verticalSpaceSmall,
            Painter(globalKey: GlobalKey()),
          ],
        ));
  }

  @override
  PracticeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      PracticeViewModel();

  @override
  void onViewModelReady(PracticeViewModel viewModel) {
    viewModel.init();
  }
}
