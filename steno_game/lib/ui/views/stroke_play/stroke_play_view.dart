import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:steno_game/ui/views/stroke_play/stroke_play_viewmodel.dart';

import '../../custom_widgets/game_bar.dart';
import '../../custom_widgets/game_body.dart';
import '../../custom_widgets/play_card.dart';

class StrokePlayView extends StackedView<StrokePlayViewModel> {
  const StrokePlayView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    StrokePlayViewModel viewModel,
    Widget? child,
  ) {
    return GameBody(
      body: Column(
        children: [
          GameBar(),
          GridView(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            children: [
              PlayCard(label: "Multi Player", onClick: () {  },),
              PlayCard(label: "Strokes Quiz", onClick: viewModel.goToStrokeQuizView),
            ],
          ),
        ],
      ),
    );
  }

  @override
  StrokePlayViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      StrokePlayViewModel();
}
