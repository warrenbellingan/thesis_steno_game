import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:steno_game/app/app.locator.dart';
import 'package:steno_game/ui/custom_widgets/player_profile.dart';

import '../common/ui_helpers.dart';
import '../constants/game_color.dart';

class InGameBar extends StatelessWidget {
  InGameBar(
      {super.key,
      required this.name,
      required this.level,
      this.image,
      this.isStudent});

  final navigationSer = locator<NavigationService>();
  final String name;
  final int level;
  final String? image;
  final bool? isStudent;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        boxShadow: [primaryShadow()],
        color: GameColor.primaryBackgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          PlayerProfile(
            name: name,
            level: level,
            imagePath: image,
            isStudent: isStudent,
          ),
          IconButton(
            onPressed: () {
              navigationSer.back();
            },
            icon: const Icon(Icons.menu),
          ),
        ],
      ),
    );
  }
}
