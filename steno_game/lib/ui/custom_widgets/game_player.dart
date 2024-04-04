import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../constants/game_color.dart';
import '../constants/game_ui_png.dart';

class GamePlayer extends StatelessWidget {
  const GamePlayer(
      {super.key,
      required this.name,
      this.imagePath,
      required this.withTail,
      this.tailText});

  final String name;
  final String? imagePath;
  final String? tailText;
  final bool withTail;

  ImageProvider getImage() {
    if (imagePath == null) return const AssetImage(GameUiPng.gameAvatarPath);
    return NetworkImage(imagePath!);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black, width: 2)),
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
              radius: 12,
              backgroundImage: getImage(),
              backgroundColor: GameColor.secondaryColor,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Container(
              child: Text(
                name,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.5,
                  fontSize: 12,
                  wordSpacing: 3,
                ),
              ),
            ),
          ),
          if (withTail)
            Expanded(
              child: Text(
                textAlign: TextAlign.right,
                tailText!,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.5,
                  fontSize: 12,
                  wordSpacing: 3,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
