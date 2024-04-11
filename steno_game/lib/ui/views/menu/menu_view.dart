import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:steno_game/model/user.dart';
import 'package:steno_game/ui/custom_widgets/game_loading.dart';
import 'package:steno_game/ui/custom_widgets/menu_card.dart';
import '../../common/ui_helpers.dart';
import '../../constants/game_color.dart';
import '../../custom_widgets/game_player.dart';
import 'menu_viewmodel.dart';

class MenuView extends StackedView<MenuViewModel> {
  const MenuView(this.user, {Key? key}) : super(key: key);
  final User user;

  @override
  Widget builder(
    BuildContext context,
    MenuViewModel viewModel,
    Widget? child,
  ) {
    return SingleChildScrollView(
      child: viewModel.isBusy
          ? const GameLoading()
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: viewModel.goToSearchSteno,
                  child: AbsorbPointer(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      margin: const EdgeInsets.symmetric(horizontal: 18),
                      decoration: BoxDecoration(
                          color: GameColor.secondaryBackgroundColor,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [primaryShadow()]),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Search Steno",
                            style: TextStyle(
                              fontSize: 18,
                              color: GameColor.primaryBackgroundColor,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.5,
                            ),
                          ),
                          horizontalSpaceSmall,
                          Icon(
                            Icons.search,
                            size: 35,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                verticalSpaceTiny,
                if (viewModel.isStudent())
                  MenuCard(
                      text: "Practice Strokes",
                      onClick: viewModel.goToPractice,
                      iconData: Icons.edit),
                if (!(viewModel.isStudent()))
                  MenuCard(
                      text: "Host Stroke Game",
                      onClick: viewModel.goToCreateHost,
                      iconData: Icons.play_circle),
                if (!(viewModel.isStudent()))
                  MenuCard(
                      text: "Manage Quizzes",
                      onClick: viewModel.goToQuiz,
                      iconData: Icons.quiz),

                Container(
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
                      const Text(
                        "Top Scores:",
                        style: TextStyle(
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
                      viewModel.users.isNotEmpty
                          ? ListView.builder(
                          itemCount: viewModel.users.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            var student = viewModel.users[index];
                            return GamePlayer(
                              name: student.name,
                              imagePath: student.image,
                              withTail: true,
                              tailText:
                              "Scores: ${viewModel.users[index].score}",
                            );
                          })
                          : const Text(
                        "No Students found",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }

  @override
  MenuViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      MenuViewModel(user);

  @override
  void onViewModelReady(MenuViewModel viewModel) {
    viewModel.init();
  }
}
