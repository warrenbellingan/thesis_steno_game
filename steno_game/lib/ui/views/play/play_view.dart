import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../constants/game_color.dart';
import 'play_viewmodel.dart';

class PlayView extends StackedView<PlayViewModel> {
  const PlayView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    PlayViewModel viewModel,
    Widget? child,
  ) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: viewModel.goToStrokePlayPage,
            child: Container(
              padding: EdgeInsets.only(top: 8),
              margin: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
              width: double.infinity,
              height: 220,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: GameColor.primaryGradient,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'STROKES',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5),
                  ),
                  Icon(Icons.edit, size: 100, color: Colors.white),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: viewModel.goToTypingPlayPage,
            child: Container(
              padding: EdgeInsets.only(top: 8),
              margin: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
              width: double.infinity,
              height: 220,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: GameColor.primaryGradient,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'TYPING',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5),
                  ),
                  Icon(Icons.keyboard, size: 100, color: Colors.white),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  PlayViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      PlayViewModel();
}
