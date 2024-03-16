import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../common/ui_helpers.dart';
import '../../constants/game_color.dart';
import 'menu_viewmodel.dart';

class MenuView extends StackedView<MenuViewModel> {
  const MenuView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    MenuViewModel viewModel,
    Widget? child,
  ) {
    return SingleChildScrollView(
      child: SingleChildScrollView(
        child: Column(
          children: [
            verticalSpaceSmall,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: viewModel.goToSearchStrokes,
                  child: AbsorbPointer(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: GameColor.secondaryBackgroundColor,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [primaryShadow()]
                      ),
                      child: const Row(
                        children: [
                          Text(
                            "Strokes",
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
                InkWell(
                  onTap: viewModel.goToSearchTyping,
                  child: AbsorbPointer(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: GameColor.secondaryBackgroundColor,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [primaryShadow()]
                      ),
                      child: const Row(
                        children: [
                          Text(
                            "Typing",
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
              ],
            ),
            verticalSpaceMedium,
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: GameColor.primaryGradient,
                boxShadow: [primaryShadow()],
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Practice Strokes',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1),
                  ),
                  Icon(
                    Icons.edit,
                    color: Colors.white,
                    size: 30,
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: GameColor.primaryGradient,
                boxShadow: [primaryShadow()],
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Practice Typing',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1),
                  ),
                  Icon(
                    Icons.keyboard,
                    color: Colors.white,
                    size: 30,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  MenuViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      MenuViewModel();
}
