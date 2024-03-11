import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../common/ui_helpers.dart';
import '../../constants/game_color.dart';
import '../../custom_widgets/game_search_textfield.dart';
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

            const SizedBox(
              height: 24,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  vertical: 8, horizontal: 8),
              padding: EdgeInsets.symmetric(
                  vertical: 8, horizontal: 8),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: GameColor.primaryGradient,
                boxShadow: [primaryShadow()],
              ),
              child: Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
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
              margin: EdgeInsets.symmetric(
                  vertical: 8, horizontal: 8),
              padding: EdgeInsets.symmetric(
                  vertical: 8, horizontal: 8),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: GameColor.primaryGradient,
                boxShadow: [primaryShadow()],
              ),
              child: Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
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
