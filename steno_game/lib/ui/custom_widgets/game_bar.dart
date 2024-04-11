import 'package:steno_game/ui/common/ui_helpers.dart';

import '../constants/game_color.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/app.locator.dart';

class GameBar extends StatelessWidget {
  GameBar({
    super.key, this.label,
  });

  final _navigationService = locator<NavigationService>();
  final String? label;

  void backPressed() {
    _navigationService.back();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        boxShadow: [primaryShadow()],
            color: Colors.white,
          borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          IconButton(
            alignment: Alignment.centerLeft,
            onPressed: backPressed,
            color: GameColor.primaryColor,
            iconSize: 40,
            icon: const Icon(
              Icons.arrow_back,
            ),
          ),
          horizontalSpaceMedium,
          Text(label ?? "", style: TextStyle(
            fontSize: 24,
            color: GameColor.secondaryBackgroundColor,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5, wordSpacing: 3,
          ),)
        ],
      ),
    );
  }
}
