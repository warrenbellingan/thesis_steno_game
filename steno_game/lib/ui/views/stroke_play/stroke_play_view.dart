import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:steno_game/ui/views/stroke_play/stroke_play_viewmodel.dart';
import '../../custom_widgets/play_card.dart';

class StrokePlayView extends StackedView<StrokePlayViewModel> {
  const StrokePlayView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    StrokePlayViewModel viewModel,
    Widget? child,
  ) {
    return Column(
      children: [
        GridView(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          children: [
            PlayCard(
              label: "Multiplayer",
              onClick: viewModel.goToJoinMultiplayerStrokeView,
              icon: Icons.people_alt_rounded,
            ),
            PlayCard(
              label: "Quiz",
              onClick: viewModel.goToStrokeQuizView,
              icon: Icons.quiz,
            ),
          ],
        ),
      ],
    );
  }

  @override
  StrokePlayViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      StrokePlayViewModel();
}
