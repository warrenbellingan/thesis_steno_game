import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:steno_game/ui/common/ui_helpers.dart';
import 'package:steno_game/ui/custom_widgets/game_bar.dart';
import 'package:steno_game/ui/custom_widgets/game_body.dart';
import 'package:steno_game/ui/custom_widgets/game_empty.dart';
import 'package:steno_game/ui/custom_widgets/game_loading.dart';
import 'package:steno_game/ui/custom_widgets/game_search_textfield.dart';

import 'join_multiplayer_stroke_viewmodel.dart';

class JoinMultiplayerStrokeView
    extends StackedView<JoinMultiplayerStrokeViewModel> {
  const JoinMultiplayerStrokeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    JoinMultiplayerStrokeViewModel viewModel,
    Widget? child,
  ) {
    return GameBody(
      body: Column(
        children: [
          GameBar(),
          const Text(
            "Search game code",
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.5,
              wordSpacing: 3,
            ),
          ),
          verticalSpaceTiny,
          GameSearchTextField(
            controller: viewModel.searchTextController,
            onClick: viewModel.searchGames,
          ),
          verticalSpaceSmall,
          viewModel.isBusy
              ? const GameLoading()
              : viewModel.games.isEmpty
                  ? const GameEmpty()
                  : Expanded(
                      child: ListView.builder(
                          itemCount: viewModel.games.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            var game = viewModel.games[index];
                            return GestureDetector(
                              onTap: () {
                                viewModel.onClickGame(game);
                              },
                              child: Container(
                                margin: const EdgeInsets.all(4),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Colors.grey,
                                    width: 2,
                                  ),
                                ),
                                child: Text(
                                  game.id,
                                  style: const TextStyle(
                                    letterSpacing: 2,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
        ],
      ),
    );
  }

  @override
  JoinMultiplayerStrokeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      JoinMultiplayerStrokeViewModel();

  @override
  void onViewModelReady(JoinMultiplayerStrokeViewModel viewModel) {
    viewModel.init();
  }
}
