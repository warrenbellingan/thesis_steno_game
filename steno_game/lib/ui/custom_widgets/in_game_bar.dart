import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:steno_game/app/app.locator.dart';
import 'package:steno_game/ui/custom_widgets/player_profile.dart';

import '../common/ui_helpers.dart';
import '../constants/game_color.dart';

class InGameBar extends StatelessWidget {
  InGameBar({super.key, required this.name, this.image, this.isStudent});

  final navigationSer = locator<NavigationService>();
  final String name;
  final String? image;
  final bool? isStudent;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
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
            imagePath: image,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(50),
                color: Colors.white),
            child: IconButton(
              iconSize: 30,
              onPressed: () {
                navigationSer.back();
              },
              visualDensity: VisualDensity.compact,
              color: Colors.black,
              icon: const Icon(Icons.home_filled),
            ),
          ),
        ],
      ),
    );
  }
}
