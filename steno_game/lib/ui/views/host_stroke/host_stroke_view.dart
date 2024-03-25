import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:steno_game/ui/common/ui_helpers.dart';
import 'package:steno_game/ui/constants/game_color.dart';
import 'package:steno_game/ui/custom_widgets/game_bar.dart';
import 'package:steno_game/ui/custom_widgets/game_button.dart';
import 'package:steno_game/ui/custom_widgets/game_loading.dart';
import 'package:steno_game/ui/custom_widgets/game_player.dart';
import '../../custom_widgets/game_body.dart';
import 'host_stroke_viewmodel.dart';

class HostStrokeView extends StackedView<HostStrokeViewModel> {
  const HostStrokeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HostStrokeViewModel viewModel,
    Widget? child,
  ) {
    return GameBody(
      body: viewModel.isBusy
          ? const GameLoading(
              label: "Creating Game",
            )
          : Column(
              children: [
                GameBar(),
                Column(
                  children: [
                    const Text(
                      "Share this code to your students",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1,
                        wordSpacing: 2,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black, width: 1.5)),
                      child: Text(
                        viewModel.gameId,
                        style: const TextStyle(
                          color: GameColor.primaryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                  ],
                ),
                verticalSpaceSmall,
                GameButton(text: "START GAME", onClick: viewModel.startGame),
                verticalSpaceSmall,
                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                        color: GameColor.tertiaryColor,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            color: GameColor.secondaryColor, width: 2)),
                    child: Column(
                      children: [
                        Text(
                          "Players: ${viewModel.students.length}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.8,
                          ),
                        ),
                        const Divider(
                          color: Colors.white,
                          thickness: 2,
                        ),
                        verticalSpaceSmall,
                        Expanded(
                          child: viewModel.students.isNotEmpty
                              ? ListView.builder(
                                  itemCount: viewModel.students.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    var student = viewModel.students[index];
                                    return GamePlayer(
                                      name: student.name,
                                      imagePath: student.image,
                                      withTail: false,
                                    );
                                  })
                              : const Text(
                                  "Waiting for students to join",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  @override
  HostStrokeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HostStrokeViewModel();

  @override
  void onViewModelReady(HostStrokeViewModel viewModel) {
    viewModel.init();
  }
}
