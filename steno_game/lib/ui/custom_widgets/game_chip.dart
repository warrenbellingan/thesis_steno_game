import 'package:flutter/material.dart';

import '../constants/game_color.dart';

class GameChip extends StatelessWidget {
  GameChip({super.key, required this.label});

  final String label;
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Chip(
        padding: EdgeInsets.all(8),
        backgroundColor: isSelected
            ? GameColor.secondaryBackgroundColor
            : GameColor.primaryColor,
        label: Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
