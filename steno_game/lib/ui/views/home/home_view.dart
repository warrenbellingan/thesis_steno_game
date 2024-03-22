import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:steno_game/ui/views/menu/menu_view.dart';
import '../../common/ui_helpers.dart';
import '../../constants/game_color.dart';
import '../../constants/game_ui_text.dart';
import '../../custom_widgets/game_body.dart';
import '../../custom_widgets/game_loading.dart';
import '../../custom_widgets/player_profile.dart';
import '../achievement/achievement_view.dart';
import '../lessons/lessons_view.dart';
import '../people/people_view.dart';
import '../play/play_view.dart';
import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return GameBody(
      body: viewModel.isBusy
          ? const GameLoading(
              label: "Getting User",
            )
          : Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                    boxShadow: [
                      primaryShadow(),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: viewModel.goToProfileView,
                        child: PlayerProfile(
                          name: viewModel.user.name,
                          level: viewModel.user.level,
                          imagePath: viewModel.user.image,
                        ),
                      ),
                      if(viewModel.isStudent())
                      Text(
                        "Score: ${viewModel.user.score.toString()} ",
                        style: const TextStyle(
                          color: GameColor.primaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          wordSpacing: 2,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Expanded(
                  child: PageView(
                    controller: viewModel.pageController,
                    physics: const AlwaysScrollableScrollPhysics(),
                    onPageChanged: viewModel.onPageChanged,
                    children: [
                      MenuView(viewModel.user),
                      const LessonsView(),
                      if (viewModel.isStudent()) const PlayView(),
                      if (viewModel.isStudent()) const AchievementView(),
                      const PeopleView(),
                    ],
                  ),
                ),
                NavigationBarTheme(
                  data: NavigationBarThemeData(
                    indicatorColor: Colors.white,
                    labelTextStyle:
                        MaterialStateProperty.resolveWith<TextStyle>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.selected)) {
                          return const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: GameColor.primaryColor,
                          );
                        } else {
                          return const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          );
                        }
                      },
                    ),
                  ),
                  child: NavigationBar(
                    backgroundColor: Colors.white,
                    height: 70,
                    shadowColor: const Color(0xFF948D8D),
                    selectedIndex: viewModel.currentPageIndex,
                    onDestinationSelected: viewModel.onDestinationSelected,
                    destinations: [
                      const NavigationDestination(
                        icon: Icon(
                          Icons.home,
                          size: 25,
                        ),
                        selectedIcon: Icon(
                          Icons.home,
                          color: GameColor.primaryColor,
                          size: 30,
                        ),
                        label: GameUIText.menuText,
                      ),
                      const NavigationDestination(
                        icon: Icon(
                          Icons.play_lesson_rounded,
                          size: 25,
                        ),
                        selectedIcon: Icon(
                          Icons.play_lesson_rounded,
                          color: GameColor.primaryColor,
                          size: 30,
                        ),
                        label: GameUIText.lessonText,
                      ),
                      if (viewModel.isStudent())
                        const NavigationDestination(
                          icon: Icon(
                            Icons.play_circle,
                            size: 25,
                          ),
                          selectedIcon: Icon(
                            Icons.play_circle,
                            color: GameColor.primaryColor,
                            size: 30,
                          ),
                          label: GameUIText.playText,
                        ),
                      if (viewModel.isStudent())
                        const NavigationDestination(
                          icon: Icon(
                            Icons.badge_rounded,
                            size: 25,
                          ),
                          selectedIcon: Icon(
                            Icons.badge_rounded,
                            color: GameColor.primaryColor,
                            size: 30,
                          ),
                          label: GameUIText.achievementText,
                        ),
                      const NavigationDestination(
                        icon: Icon(
                          Icons.people_alt_outlined,
                          size: 25,
                        ),
                        selectedIcon: Icon(
                          Icons.people_alt_outlined,
                          color: GameColor.primaryColor,
                          size: 30,
                        ),
                        label: GameUIText.peopleText,
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();

  @override
  void onViewModelReady(HomeViewModel viewModel) {
    viewModel.init();
  }
}
