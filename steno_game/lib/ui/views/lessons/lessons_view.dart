import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:steno_game/ui/constants/game_color.dart';
import 'package:steno_game/ui/custom_widgets/game_loading.dart';
import '../../../model/lesson.dart';
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
          viewModel.isBusy
              ? const GameLoading()
              : ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: viewModel.lessons.length,
                  itemBuilder: (context, index) {
                    var item = viewModel.lessons[index];
                    return LessonMainCard(
                      label: item.title,
                      onLessonClick: () {
                        viewModel.lessonClick(item);
                      },
                      onEditClick: () => viewModel.lessonEditClick(item),
                      onDeleteClick: () => viewModel.lessonDeleteClick(item),
                      isInstructor: viewModel.user.role == "Instructor",
                    );
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
