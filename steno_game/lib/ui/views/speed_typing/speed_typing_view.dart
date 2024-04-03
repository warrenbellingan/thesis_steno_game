import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:steno_game/ui/common/ui_helpers.dart';
import '../../constants/game_color.dart';
import '../../custom_widgets/game_body.dart';
import '../../custom_widgets/game_button.dart';
import '../../custom_widgets/in_game_bar.dart';
import 'speed_typing_viewmodel.dart';

class SpeedTypingView extends StackedView<SpeedTypingViewModel> {
  const SpeedTypingView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SpeedTypingViewModel viewModel,
    Widget? child,
  ) {
    return GameBody(
      body: KeyboardListener(
        focusNode: viewModel.focusNode,
        onKeyEvent: viewModel.onKeyReceived,
        child: Column(
          children: [
            InGameBar(name: "Warren"),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    verticalSpaceSmall,
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(8),
                      child: Text(
                        "1:00",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Container(
                      width: double.infinity,
                      height: 500,
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1.5,
                          style: BorderStyle.solid,
                          color: GameColor.secondaryColor,
                        ),
                      ),
                      child: Text(
                        viewModel.words[viewModel.currentIndex],
                        style: const TextStyle(
                          fontSize: 20,
                          wordSpacing: 2,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    verticalSpaceSmall,
                  ],
                ),
              ),
            ),
            GameButton(text: "Start", onClick: () {}),
          ],
        ),
      ),
    );
  }

  @override
  SpeedTypingViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SpeedTypingViewModel(context);
}
