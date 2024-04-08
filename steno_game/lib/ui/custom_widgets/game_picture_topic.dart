import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:steno_game/ui/common/ui_helpers.dart';
import 'package:steno_game/ui/constants/game_color.dart';
import 'package:steno_game/ui/custom_widgets/game_network_image.dart';
import 'package:steno_game/ui/custom_widgets/stroke_image.dart';

class GamePictureTopic extends StatelessWidget {
  const GamePictureTopic({
    super.key,
    required this.image,
    required this.text,
    required this.description,
    required this.isOnline,
  });

  final String image;
  final String text;
  final String description;
  final bool isOnline;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StrokeImage(imagePath: image, word: text, isOnline: isOnline,),
        verticalSpaceMedium,
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              width: 2,
              style: BorderStyle.solid,
              color: Colors.black,
            ),
          ),
          child: Text(
            description,
            textAlign: TextAlign.justify,
            style: const TextStyle(
              fontSize: 16,
              letterSpacing: 1,
              wordSpacing: 2,
            ),
          ),
        ),
      ],
    );
  }
}
