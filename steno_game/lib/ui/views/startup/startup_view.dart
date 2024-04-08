import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:stacked/stacked.dart';
import 'package:steno_game/ui/constants/game_color.dart';
import '../../constants/game_ui_png.dart';
import '../../custom_widgets/game_image.dart';
import 'startup_viewmodel.dart';

class StartupView extends StackedView<StartupViewModel> {
  const StartupView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    StartupViewModel viewModel,
    Widget? child,
  ) {
    return const Scaffold(
      backgroundColor: Color(0xFFDCDCDC),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GameImage(
              path: GameUiPng.gameLogoPath,size: 100,
            ),
            Text(
              'StenoSprint',
              style: TextStyle(
                color: GameColor.primaryColor,
                fontSize: 35,
                fontWeight: FontWeight.w900,
                letterSpacing: 2,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            CircularProgressIndicator(
              color: GameColor.primaryColor,
              strokeWidth: 6,
            ),
          ],
        ),
      ),
    );
  }

  @override
  StartupViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      StartupViewModel();

  @override
  void onViewModelReady(StartupViewModel viewModel) => SchedulerBinding.instance
      .addPostFrameCallback((timeStamp) => viewModel.runStartupLogic());
}
