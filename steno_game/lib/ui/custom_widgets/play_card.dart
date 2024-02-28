import 'package:flutter/material.dart';

import '../common/ui_helpers.dart';
import '../constants/game_color.dart';

typedef OnClick = Function();
class PlayCard extends StatelessWidget {
  const PlayCard({super.key, required this.label, required this.onClick});

  final String label;
  final OnClick onClick;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: AbsorbPointer(
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 1,
              style: BorderStyle.solid,
            ),
            gradient: GameColor.primaryGradient,
            boxShadow: [primaryShadow()],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            textAlign: TextAlign.center,
            label,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              wordSpacing: 2,
              letterSpacing: 1.5,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
