import 'package:flutter/material.dart';

import '../constants/game_color.dart';

typedef OnClick = Function();
class GameChip extends StatelessWidget {
  GameChip({super.key, required this.label, required this.onClick});

  final String label;
  final OnClick onClick;
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
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
