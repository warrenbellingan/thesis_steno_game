import 'package:flutter/material.dart';
import 'package:steno_game/ui/custom_widgets/player_profile.dart';

import '../common/ui_helpers.dart';
import '../constants/game_color.dart';

class InGameBar extends StatelessWidget {
  const InGameBar({super.key});

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
            name: 'Sampple',
            level: 1,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu),
          ),
        ],
      ),
    );
  }
}
