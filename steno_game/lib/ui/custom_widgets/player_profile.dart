import '../constants/game_color.dart';
import 'package:flutter/material.dart';

import '../constants/game_png.dart';

class PlayerProfile extends StatelessWidget {
  const PlayerProfile({super.key, required this.name, required this.level});

  final String name;
  final int level;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  style: BorderStyle.solid,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(50)),
            child: CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage(GamePng.gameAvatarPath),
              backgroundColor: GameColor.secondaryColor,
            ),
          ),
          SizedBox(
            width: 3,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Warren',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                  fontSize: 14,
                  wordSpacing: 3,
                ),
              ),
              Text(
                'Level 1',
                style: TextStyle(
                  color: GameColor.secondaryColor,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                  fontSize: 14,
                  wordSpacing: 3,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
