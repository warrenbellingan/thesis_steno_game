import 'package:flutter/material.dart';

import '../constants/game_color.dart';

typedef OnClick = Function();

class GameIconButton extends StatelessWidget {
  const GameIconButton(
      {super.key, required this.onClick, required this.icon, this.size});

  final OnClick onClick;
  final IconData icon;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(50),
      onTap: onClick,
      child: AbsorbPointer(
        child:
            Icon(size: size, color: GameColor.secondaryBackgroundColor, icon),
      ),
    );
  }
}
