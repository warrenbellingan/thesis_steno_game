import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:steno_game/model/user.dart';
import 'package:steno_game/ui/custom_widgets/game_loading.dart';
import 'package:steno_game/ui/custom_widgets/menu_card.dart';
import '../../common/ui_helpers.dart';
import '../../constants/game_color.dart';
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
                  Column(
                    children: [
                      MenuCard(
                          text: "Practice Strokes",
                          onClick: () {},
                          iconData: Icons.edit),
                      MenuCard(
                          text: "Practice Typing",
                          onClick: () {},
                          iconData: Icons.keyboard),
                    ],
                  ),
                if (!(viewModel.isStudent()))
                  MenuCard(
                      text: "Host Stroke Game",
                      onClick: viewModel.goToCreateHost,
                      iconData: Icons.play_circle),
              ],
            ),
    );
  }

  @override
  MenuViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      MenuViewModel(user);
}
