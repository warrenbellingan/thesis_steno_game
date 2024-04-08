import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';
import 'package:steno_game/ui/common/ui_helpers.dart';
import 'package:steno_game/ui/constants/game_color.dart';
import 'package:steno_game/ui/custom_widgets/game_bar.dart';
import 'package:steno_game/ui/custom_widgets/game_body.dart';
import 'package:steno_game/ui/custom_widgets/game_empty.dart';
import 'package:steno_game/ui/custom_widgets/game_loading.dart';
import 'package:steno_game/ui/custom_widgets/game_navigator.dart';
import 'package:steno_game/ui/custom_widgets/game_picture_topic.dart';
import '../../../model/lesson.dart';
import 'topic_viewmodel.dart';

class TopicView extends StackedView<TopicViewModel> {
  const TopicView(this.lesson, this.isOnline, {Key? key}) : super(key: key);
  final Lesson lesson;
  final bool isOnline;

  @override
  Widget builder(
    BuildContext context,
    TopicViewModel viewModel,
    Widget? child,
  ) {
    return GameBody(
      body: viewModel.isBusy
          ? const GameLoading()
          : Column(
              children: [
                GameBar(),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(
                          lesson.title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: GameColor.secondaryBackgroundColor,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2,
                              wordSpacing: 2),
                        ),
                        verticalSpaceSmall,
                        viewModel.topics.isEmpty
                            ? const GameEmpty()
                            : GamePictureTopic(
                                image: viewModel.stroke!.strokeImage,
                                text: viewModel.stroke!.text,
                                description: viewModel
                                    .topics[viewModel.currentIndex].description, isOnline: isOnline,
                              )
                      ],
                    ),
                  ),
                ),
                if (viewModel.topics.isNotEmpty)
                  GameNavigator(
                    previousClick: () =>
                        viewModel.changePage(viewModel.currentIndex - 1),
                    nextClick: () =>
                        viewModel.changePage(viewModel.currentIndex + 1),
                    currentPage: viewModel.currentIndex + 1,
                    allPage: viewModel.topics.length,
                  ),
              ],
            ),
    );
  }

  @override
  TopicViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      TopicViewModel(lesson,isOnline);

  @override
  void onViewModelReady(TopicViewModel viewModel) {
    viewModel.init();
  }
}
