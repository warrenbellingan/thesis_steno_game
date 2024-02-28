import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:steno_game/app/app.locator.dart';
import 'package:steno_game/ui/custom_widgets/player_profile.dart';

import '../common/ui_helpers.dart';
import '../constants/game_color.dart';

class InGameBar extends StatelessWidget {
  InGameBar({super.key});

  final navigationSer = locator<NavigationService>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        boxShadow: [primaryShadow()],
        color: GameColor.primaryBackgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          PlayerProfile(
            name: 'Sample',
            level: 1,
          ),
          IconButton(
            onPressed: () {
              navigationSer.back();
            },
            icon: Icon(Icons.menu),
          ),
        ],
      ),
    );
  }
}
