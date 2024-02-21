import '../constants/game_color.dart';
import 'package:flutter/material.dart';

typedef OnClick = Function();

class GameTextButton extends StatelessWidget {
  const GameTextButton({super.key, required this.title, required this.onClick});

  final String title;
  final OnClick onClick;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onClick,
      child: Text(
        title,
        style: TextStyle(
          color: GameColor.primaryColor,
          fontSize: 18,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.5,
          wordSpacing: 4,
        ),
      ),
    );
  }
}
