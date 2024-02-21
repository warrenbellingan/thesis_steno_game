import 'package:flutter/material.dart';

import '../common/ui_helpers.dart';
import '../constants/game_color.dart';

class PlayCard extends StatelessWidget {
  const PlayCard({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(20),
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
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          wordSpacing: 2,
          letterSpacing: 1.5,
          color: Colors.white,
        ),
      ),
    );
  }
}
