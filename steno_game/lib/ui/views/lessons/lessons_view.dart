import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:steno_game/ui/constants/game_color.dart';
import 'package:steno_game/ui/custom_widgets/game_loading.dart';

import '../../custom_widgets/game_chip.dart';
import '../../custom_widgets/lesson_main_card.dart';
import 'lessons_viewmodel.dart';

class LessonsView extends StackedView<LessonsViewModel> {
  const LessonsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    LessonsViewModel viewModel,
    Widget? child,
  ) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(color: Colors.white),
            width: double.infinity,
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => viewModel.getLessons("strokes"),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                          style: BorderStyle.solid,
                        ),
                      ),
                      child:  Text(
                        textAlign: TextAlign.center,
                        "STROKES",
                        style: viewModel.selectedIndex == 1 ? const TextStyle(
                          color: GameColor.secondaryBackgroundColor,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.3,
                        ) : const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.3,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => viewModel.getLessons("typing"),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                          style: BorderStyle.solid,
                        ),
                      ),
                      child:  Text(
                        textAlign: TextAlign.center,
                        "TYPING",
                        style: viewModel.selectedIndex == 2 ? const TextStyle(
                          color: GameColor.secondaryBackgroundColor,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.3,
                        ) : const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.3,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          viewModel.isBusy
              ? GameLoading(
                  label: "Getting lessons",
                )
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: viewModel.lessons.length,
                  itemBuilder: (context, index) {
                    var item = viewModel.lessons[index];
                    return LessonMainCard(label: item.title);
                  },
                ),
        ],
      ),
    );
  }

  @override
  LessonsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LessonsViewModel();

  @override
  void onViewModelReady(LessonsViewModel viewModel) {
    viewModel.init();
  }
}
