import 'package:flutter/widgets.dart';

import '../constants/game_color.dart';
import 'package:flutter/material.dart';

import '../constants/game_png.dart';

class PlayerProfile extends StatelessWidget {
  const PlayerProfile(
      {super.key,
      required this.name,
      required this.level,
      this.imagePath,
      this.isStudent});

  final String name;
  final int level;
  final String? imagePath;
  final bool? isStudent;

  ImageProvider getImage() {
    if (imagePath == null) return const AssetImage(GamePng.gameAvatarPath);
    return NetworkImage(imagePath!);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
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
              backgroundImage: getImage(),
              backgroundColor: GameColor.secondaryColor,
            ),
          ),
          const SizedBox(
            width: 3,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                  fontSize: 14,
                  wordSpacing: 3,
                ),
              ),
              if (isStudent == null)
                Text(
                  'Level ${level.toString()}',
                  style: const TextStyle(
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
