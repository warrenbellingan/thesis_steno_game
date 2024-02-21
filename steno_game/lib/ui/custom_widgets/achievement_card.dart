import 'package:flutter/material.dart';

import '../constants/game_color.dart';

class AchievementCard extends StatelessWidget {
  AchievementCard({
    super.key,
    required this.isComplete,
    required this.title,
    required this.description,
  });

  bool isComplete;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border:
            Border.all(color: Colors.black, width: 2, style: BorderStyle.solid),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              vertical: 4,
            ),
            decoration: BoxDecoration(
              color: isComplete
                  ? GameColor.primaryColor
                  : GameColor.secondaryColor,
              borderRadius: BorderRadius.circular(9),
            ),
            child: Text(
              isComplete ? 'Complete' : 'InComplete',
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  letterSpacing: 2),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                    color: GameColor.secondaryBackgroundColor,
                  ),
                ),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: GameColor.primaryColor,
              borderRadius: BorderRadius.circular(8),
            ),
            height: 10,
          ),
        ],
      ),
    );
  }
}
