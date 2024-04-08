import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:steno_game/ui/common/ui_helpers.dart';
import 'package:steno_game/ui/constants/game_color.dart';
import 'package:steno_game/ui/custom_widgets/game_bar.dart';
import 'package:steno_game/ui/custom_widgets/game_body.dart';
import 'package:steno_game/ui/custom_widgets/game_loading.dart';
import 'quiz_game_stroke_viewmodel.dart';

class QuizGameStrokeView extends StackedView<QuizGameStrokeViewModel> {
  const QuizGameStrokeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    QuizGameStrokeViewModel viewModel,
    Widget? child,
  ) {
    return GameBody(
      body: viewModel.isBusy
          ? const GameLoading()
          : SingleChildScrollView(
              child: Column(
                children: [
                  GameBar(),
                  ListView.builder(
                    itemCount: viewModel.quizzes.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      var item = viewModel.quizzes[index];
                      return Stack(
                        alignment: Alignment.topRight,
                        children: [
                          InkWell(
                            onTap: () => viewModel.goToQuiz(item),
                            child: AbsorbPointer(
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 8),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 8),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: GameColor.secondaryBackgroundColor,
                                  borderRadius: BorderRadius.circular(30),
                                  boxShadow: [primaryShadow()],
                                ),
                                child: Text(
                                  item.title,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1.5,
                                    wordSpacing: 2.5,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: () => viewModel.editQuiz(item),
                                icon: const Icon(
                                  Icons.edit_rounded,
                                  color: Colors.white,
                                ),
                              ),
                              IconButton(
                                onPressed: () => viewModel.deleteQuiz(item.id),
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                ),
                              ),
                              horizontalSpaceSmall,
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
      floatingAction: viewModel.isBusy
          ? null
          : viewModel.user!.role == "Instructor"
              ? Container(
                  margin: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [primaryShadow()],
                      borderRadius: BorderRadius.circular(50)),
                  child: IconButton(
                    onPressed: viewModel.addQuiz,
                    icon: const Icon(
                      Icons.add,
                      size: 50,
                      color: GameColor.primaryColor,
                    ),
                  ),
                )
              : null,
    );
  }

  @override
  QuizGameStrokeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      QuizGameStrokeViewModel();

  @override
  void onViewModelReady(QuizGameStrokeViewModel viewModel) {
    viewModel.init();
  }
}
