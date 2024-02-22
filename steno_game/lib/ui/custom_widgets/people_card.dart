import 'package:flutter/material.dart';
import 'package:steno_game/ui/custom_widgets/player_profile.dart';
import '../common/ui_helpers.dart';
import '../constants/game_color.dart';
import 'add_friend.dart';

class PeopleCard extends StatelessWidget {
  const PeopleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
      padding: EdgeInsets.symmetric(vertical: 4),
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
            name: 'Sample',
            level: 1,
          ),
          AddFriend(),
        ],
      ),
    );
  }
}
