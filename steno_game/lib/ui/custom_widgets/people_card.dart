import 'package:flutter/material.dart';
import 'package:steno_game/ui/custom_widgets/player_profile.dart';
import '../common/ui_helpers.dart';
import '../constants/game_color.dart';

typedef OnClick = Function();

class PeopleCard extends StatelessWidget {
  const PeopleCard({
    super.key,
    required this.name,
    required this.level,
    required this.onClick,
    this.image,
    this.isStudent,
  });

  final String name;
  final int level;
  final String? image;
  final OnClick onClick;
  final bool? isStudent;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
      padding: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [primaryShadow()],
        border: Border.all(
          style: BorderStyle.solid,
          color: GameColor.secondaryColor,
          width: 2,
        ),
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
          InkWell(
            onTap: onClick,
            child: AbsorbPointer(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                margin: const EdgeInsets.symmetric(horizontal: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: GameColor.primaryBackgroundColor,
                  border: Border.all(
                    color: Colors.black,
                    width: 2,
                    style: BorderStyle.solid,
                  ),
                ),
                child: const Text(
                  "View Profile",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
