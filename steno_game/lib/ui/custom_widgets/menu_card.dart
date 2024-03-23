import 'package:flutter/material.dart';

import '../common/ui_helpers.dart';
import '../constants/game_color.dart';

typedef OnClick = Function();

class MenuCard extends StatelessWidget {
  const MenuCard(
      {super.key,
      required this.text,
      required this.onClick,
      required this.iconData});

  final String text;
  final OnClick onClick;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: AbsorbPointer(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: GameColor.primaryGradient,
            boxShadow: [primaryShadow()],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1),
              ),
              Icon(
                iconData,
                color: Colors.white,
                size: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
