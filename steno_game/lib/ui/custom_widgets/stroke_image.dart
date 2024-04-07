import 'package:flutter/material.dart';
import 'package:steno_game/ui/constants/game_color.dart';

import 'game_network_image.dart';

class StrokeImage extends StatelessWidget {
  const StrokeImage(
      {super.key, required this.imagePath, required this.word, this.size});

  final String imagePath;
  final String word;
  final double? size;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: GameColor.secondaryBackgroundColor,
        border: Border.all(
          color: Colors.black,
          width: 2,
        ),
      ),
      child: Column(
        children: [
          GameNetworkImage(
            path: imagePath,
            size: size,
          ),
          Text(
            word,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.w700,
              letterSpacing: 1,
              wordSpacing: 3,
            ),
          ),
        ],
      ),
    );
  }
}
