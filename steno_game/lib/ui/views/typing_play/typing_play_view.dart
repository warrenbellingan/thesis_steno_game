import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../custom_widgets/game_bar.dart';
import '../../custom_widgets/game_body.dart';
import '../../custom_widgets/play_card.dart';
import 'typing_play_viewmodel.dart';

class TypingPlayView extends StackedView<TypingPlayViewModel> {
  const TypingPlayView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    TypingPlayViewModel viewModel,
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
              PlayCard(
                label: "Speed Typing",
                onClick: viewModel.goToSpeedTyping,
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  TypingPlayViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      TypingPlayViewModel();
}
