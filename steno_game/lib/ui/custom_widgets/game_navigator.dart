import 'package:flutter/material.dart';

import '../common/ui_helpers.dart';
import '../constants/game_color.dart';

typedef OnClick = Function();

class GameNavigator extends StatelessWidget {
  const GameNavigator(
      {super.key,
      required this.previousClick,
      required this.nextClick,
      required this.currentPage,
      required this.allPage});

  final OnClick previousClick;
  final OnClick nextClick;
  final int currentPage;
  final int allPage;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 3),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [primaryShadow()],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              visualDensity: VisualDensity.compact,
              onPressed: previousClick,
              icon:
                  const Icon(color: GameColor.primaryColor, Icons.arrow_circle_left_rounded)),
          Text(
            "$currentPage/$allPage",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              letterSpacing: 5,
            ),
          ),
          IconButton(
              visualDensity: VisualDensity.compact,
              onPressed: nextClick,
              icon:
                  const Icon(color: GameColor.primaryColor, Icons.arrow_circle_right_sharp)),
        ],
      ),
    );
  }
}
