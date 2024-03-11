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
      padding: const EdgeInsets.symmetric(vertical: 3),
      margin: const EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [primaryShadow()],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
              visualDensity: VisualDensity.compact,
              iconSize: 60,
              onPressed: previousClick,
              icon:
                  const Icon(color: GameColor.primaryColor, Icons.arrow_left)),
          Text(
            "$currentPage/$allPage",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 5,
            ),
          ),
          IconButton(
              visualDensity: VisualDensity.compact,
              iconSize: 60,
              onPressed: nextClick,
              icon:
                  const Icon(color: GameColor.primaryColor, Icons.arrow_right)),
        ],
      ),
    );
  }
}
