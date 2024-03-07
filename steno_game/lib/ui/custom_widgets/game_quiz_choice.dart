import 'package:flutter/material.dart';
import 'package:steno_game/ui/constants/game_color.dart';

typedef OnClick = Function();

class GameQuizChoice extends StatelessWidget {
  const GameQuizChoice({super.key, required this.choice, required this.onClick});

  final String choice;
  final OnClick onClick;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: AbsorbPointer(
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(vertical: 6),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
              color: Colors.white,
              border: Border.all(
            style: BorderStyle.solid,
            width: 2,
            color: GameColor.primaryColor,
          )),
          child: Text(
            choice,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
              wordSpacing: 3
            ),
          ),
        ),
      ),
    );
  }
}
