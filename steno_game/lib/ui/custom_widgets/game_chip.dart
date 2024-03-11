import 'package:flutter/material.dart';

import '../constants/game_color.dart';

typedef OnClick = Function();

class GameChip extends StatelessWidget {
  const GameChip(
      {super.key,
      required this.label,
      required this.onClick,
      required this.isSelected});

  final String label;
  final OnClick onClick;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Chip(
        padding: const EdgeInsets.all(8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        backgroundColor: isSelected
            ? GameColor.primaryColor
            : GameColor.primaryBackgroundColor,
        label: Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
