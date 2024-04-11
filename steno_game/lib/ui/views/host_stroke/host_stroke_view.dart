import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:steno_game/model/multiplayer_stroke.dart';
import 'package:steno_game/ui/common/ui_helpers.dart';
import 'package:steno_game/ui/constants/game_color.dart';
import 'package:steno_game/ui/custom_widgets/game_bar.dart';
import 'package:steno_game/ui/custom_widgets/game_button.dart';
import 'package:steno_game/ui/custom_widgets/game_loading.dart';
import 'package:steno_game/ui/custom_widgets/game_navigator.dart';
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
                GameBar(
                  label: "Add Questions",
                ),
                verticalSpaceSmall,
                Expanded(
                  child: PageView.builder(
                    controller: viewModel.pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: viewModel.questions.length + 1,
                    onPageChanged: viewModel.changePage,
                    itemBuilder: (context, index) {
                      if (index < viewModel.questions.length) {
                        var item = viewModel.questions[index];
                        return SingleChildScrollView(
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 4),
                            padding: const EdgeInsets.symmetric(
                              vertical: 4,
                              horizontal: 4,
                            ),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              border:
                                  Border.all(color: Colors.grey, width: 1.5),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
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
                                    ? Column(
                                        children: [
                                          viewModel.isEditingQuiz
                                              ? Column(
                                                  children: [
                                                    GameTextField(
                                                        controller: viewModel
                                                            .textController,
                                                        label: "Stroke Word"),
                                                    Painter(
                                                      globalKey:
                                                          viewModel.painterKey,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child: GameButton(
                                                            text: "Save",
                                                            onClick: () => viewModel
                                                                .updateStrokeQuestion(
                                                                    item,
                                                                    index),
                                                            isLoading:
                                                                viewModel.busy(
                                                                    "isUpdating"),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: GameButton(
                                                            text: "Cancel",
                                                            onClick: () => viewModel
                                                                .setIsEditingQuiz(
                                                                    null),
                                                            isLoading: false,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                )
                                              : Column(
                                                  children: [
                                                    Container(
                                                      decoration:
                                                          const BoxDecoration(
                                                        color: GameColor
                                                            .primaryBackgroundColor,
                                                      ),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          IconButton(
                                                            onPressed: () =>
                                                                viewModel
                                                                    .setIsEditingQuiz(
                                                                        item.strokeText),
                                                            icon: const Icon(Icons
                                                                .edit_rounded),
                                                            color: GameColor
                                                                .secondaryBackgroundColor,
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(0),
                                                          ),
                                                          IconButton(
                                                            onPressed: () =>
                                                                viewModel
                                                                    .deleteQuiz(
                                                                        item),
                                                            icon: const Icon(
                                                                Icons.delete),
                                                            color: GameColor
                                                                .secondaryBackgroundColor,
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(0),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          vertical: 4,
                                                          horizontal: 10),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        border: Border.all(
                                                          color: GameColor
                                                              .secondaryBackgroundColor,
                                                          width: 2,
                                                        ),
                                                      ),
                                                      child: Text(
                                                        item.strokeText!,
                                                        style: const TextStyle(
                                                            color: GameColor
                                                                .primaryColor,
                                                            fontSize: 30,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            letterSpacing: 1.5,
                                                            wordSpacing: 3),
                                                      ),
                                                    ),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: GameColor
                                                                .primaryColor,
                                                            width: 1.5),
                                                      ),
                                                      child: GameNetworkImage(
                                                        path: item.data,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                        ],
                                      )
                                    : Column(
                                        children: [
                                          viewModel.isEditingQuiz
                                              ? Column(
                                                  children: [
                                                    GameTextField(
                                                        controller: viewModel
                                                            .textController,
                                                        label: "New Word"),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child: GameButton(
                                                            text: "Save",
                                                            onClick: () => viewModel
                                                                .updateTextQuiz(
                                                                    item,
                                                                    index),
                                                            isLoading:
                                                                viewModel.busy(
                                                                    "isUpdating"),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: GameButton(
                                                            text: "Cancel",
                                                            onClick: () => viewModel
                                                                .setIsEditingQuiz(
                                                                    null),
                                                            isLoading: false,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                )
                                              : Column(
                                                  children: [
                                                    Container(
                                                      decoration:
                                                          const BoxDecoration(
                                                        color: GameColor
                                                            .primaryBackgroundColor,
                                                      ),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          IconButton(
                                                            onPressed: () => viewModel
                                                                .setIsEditingQuiz(
                                                                    item.data),
                                                            icon: const Icon(Icons
                                                                .edit_rounded),
                                                            color: GameColor
                                                                .secondaryBackgroundColor,
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(0),
                                                          ),
                                                          IconButton(
                                                            onPressed: () =>
                                                                viewModel
                                                                    .deleteQuiz(
                                                                        item),
                                                            icon: const Icon(
                                                                Icons.delete),
                                                            color: GameColor
                                                                .secondaryBackgroundColor,
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(0),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          vertical: 4,
                                                          horizontal: 10),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        border: Border.all(
                                                          color: GameColor
                                                              .secondaryBackgroundColor,
                                                          width: 2,
                                                        ),
                                                      ),
                                                      child: Text(
                                                        item.data,
                                                        style: const TextStyle(
                                                            color: GameColor
                                                                .primaryColor,
                                                            fontSize: 30,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            letterSpacing: 1.5,
                                                            wordSpacing: 3),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                        ],
                                      ),
                              ],
                            ),
                          ),
                        );
                      } else {
                        return viewModel.isEditingMode
                            ? SingleChildScrollView(
                                child: Container(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12, vertical: 3),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(50),
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
                                      viewModel.editingType == 0
                                          ? Column(
                                              children: [
                                                GameTextField(
                                                    controller: viewModel
                                                        .textController,
                                                    label: "Stroke Word"),
                                                Painter(
                                                    globalKey:
                                                        viewModel.painterKey),
                                              ],
                                            )
                                          : GameTextField(
                                              controller:
                                                  viewModel.textController,
                                              label: "Stroke Text"),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: GameButton(
                                              text: "Add",
                                              onClick: viewModel.addQuiz,
                                              isLoading:
                                                  viewModel.busy("addEditQuiz"),
                                            ),
                                          ),
                                          Expanded(
                                            child: GameButton(
                                              text: "Cancel",
                                              onClick: viewModel.cancelAdd,
                                              isLoading: false,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
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
                                                    viewModel.editMode(0),
                                                isLoading: false,
                                              ),
                                            ),
                                            Expanded(
                                              child: GameButton(
                                                text: "Word",
                                                onClick: () =>
                                                    viewModel.editMode(1),
                                                isLoading: false,
                                              ),
                                            ),
                                          ],
                                        )
                                      : const Text(
                                          "Add Quiz",
                                          style: TextStyle(
                                            fontSize: 40,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                ),
                              );
                      }
                    },
                  ),
                ),
                GameNavigator(
                    previousClick: () =>
                        viewModel.navigatePage(viewModel.currentPage - 1),
                    nextClick: () =>
                        viewModel.navigatePage(viewModel.currentPage + 1),
                    currentPage: viewModel.currentPage + 1,
                    allPage: viewModel.questions.length + 1),
                verticalSpaceSmall,
                GameButton(
                  text: "Create Game",
                  onClick: viewModel.readyGame,
                  isLoading: viewModel.busy("readyGame"),
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
}
