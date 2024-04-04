import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';
import 'package:steno_game/model/multiplayer_stroke.dart';
import 'package:steno_game/ui/common/ui_helpers.dart';
import 'package:steno_game/ui/constants/game_color.dart';
import 'package:steno_game/ui/custom_widgets/game_bar.dart';
import 'package:steno_game/ui/custom_widgets/game_button.dart';
import 'package:steno_game/ui/custom_widgets/game_loading.dart';
import 'package:steno_game/ui/custom_widgets/game_network_image.dart';
import 'package:steno_game/ui/custom_widgets/game_textfield.dart';
import 'package:steno_game/ui/custom_widgets/painter.dart';
import '../../custom_widgets/game_body.dart';
import 'host_stroke_viewmodel.dart';

class HostStrokeView extends StackedView<HostStrokeViewModel> {
  const HostStrokeView(this.game, {Key? key}) : super(key: key);

  final MultiplayerStroke game;

  @override
  Widget builder(
    BuildContext context,
    HostStrokeViewModel viewModel,
    Widget? child,
  ) {
    return GameBody(
      body: viewModel.isBusy
          ? const GameLoading()
          : Column(
              children: [
                GameBar(),
                const Text(
                  "Add Questions",
                  style: TextStyle(
                    color: GameColor.primaryColor,
                    fontSize: 26,
                    letterSpacing: 1.5,
                    wordSpacing: 3,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                verticalSpaceSmall,
                Expanded(
                  child: ListView.builder(
                    itemCount: viewModel.questions.length + 1,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      if (index < viewModel.questions.length) {
                        var item = viewModel.questions[index];
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 8,
                          ),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.grey, width: 1.5),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 3),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(50),
                                      border: Border.all(
                                        color: GameColor.primaryColor,
                                        width: 3,
                                      ),
                                    ),
                                    child: Text(
                                      "${index + 1}",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                  horizontalSpaceMedium,
                                  Text(
                                    item.type == "stroke"
                                        ? "What is this stroke?"
                                        : "What is the stroke of this?",
                                    style: const TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                              verticalSpaceSmall,
                              item.type == "stroke"
                                  ? Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: GameColor.primaryColor,
                                            width: 1.5),
                                      ),
                                      child: GameNetworkImage(path: item.data))
                                  : Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 2, horizontal: 4),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        border: Border.all(
                                          color: GameColor.primaryColor,
                                          width: 2,
                                        ),
                                      ),
                                      child: Text(
                                        item.data,
                                        style: const TextStyle(
                                            color: GameColor.primaryColor,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1.5,
                                            wordSpacing: 3),
                                      ),
                                    ),
                            ],
                          ),
                        );
                      } else {
                        return viewModel.isEditingMode
                            ? Container(
                                margin: const EdgeInsets.only(bottom: 20),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8,
                                  horizontal: 8,
                                ),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                      color: Colors.grey, width: 1.5),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12, vertical: 3),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(50),
                                        border: Border.all(
                                          color: GameColor.primaryColor,
                                          width: 3,
                                        ),
                                      ),
                                      child: Text(
                                        "${index + 1}",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                    verticalSpaceSmall,
                                    GameTextField(
                                      controller: viewModel.textController,
                                      label: "Stroke Text",
                                      icon: const Icon(
                                        Icons.edit_rounded,
                                        color:
                                            GameColor.secondaryBackgroundColor,
                                      ),
                                    ),
                                    if (viewModel.editingType == 0)
                                      Painter(globalKey: viewModel.painterKey),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: GameButton(
                                            text: "Add",
                                            onClick: viewModel.addQuiz, isLoading: false,
                                          ),
                                        ),
                                        Expanded(
                                          child: GameButton(
                                            text: "Cancel",
                                            onClick: viewModel.cancelAdd, isLoading: false,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            : GestureDetector(
                                onTap: viewModel.setShowQuizType,
                                child: Container(
                                  margin: const EdgeInsets.only(bottom: 20),
                                  alignment: Alignment.center,
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 4),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(30),
                                      border: Border.all(
                                          color: Colors.grey, width: 1.5)),
                                  child: viewModel.showQuizType
                                      ? Row(
                                          children: [
                                            Expanded(
                                              child: GameButton(
                                                text: "Stroke",
                                                onClick: () =>
                                                    viewModel.editMode(0), isLoading: false,
                                              ),
                                            ),
                                            Expanded(
                                              child: GameButton(
                                                text: "Text",
                                                onClick: () =>
                                                    viewModel.editMode(1), isLoading: false,
                                              ),
                                            ),
                                          ],
                                        )
                                      : const Text(
                                          "Add Quiz",
                                          style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                ),
                              );
                      }
                    },
                  ),
                ),
                GameButton(
                  text: "Create Game",
                  onClick: viewModel.readyGame, isLoading: viewModel.busy("readyGame"),
                ),
              ],
            ),
    );
  }

  @override
  HostStrokeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HostStrokeViewModel(game);

  @override
  void onViewModelReady(HostStrokeViewModel viewModel) {
    viewModel.init();
  }
}
