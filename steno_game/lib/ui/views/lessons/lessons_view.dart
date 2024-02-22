import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

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
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 6, horizontal: 4),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 2,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: Text(
                      textAlign: TextAlign.center,
                      "STROKES",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.3,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 6, horizontal: 4),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 2,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: Text(
                      textAlign: TextAlign.center,
                      "TYPING",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.3,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GameChip(label: "Offline"),
              GameChip(label: "Online"),
            ],
          ),
          LessonMainCard(label: 'Lesson 2'),
          LessonMainCard(label: 'Lesson 3'),
        ],
      ),
    );
  }

  @override
  LessonsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LessonsViewModel();
}
