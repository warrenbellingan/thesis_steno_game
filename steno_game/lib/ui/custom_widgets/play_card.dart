import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../common/ui_helpers.dart';
import '../constants/game_color.dart';

typedef OnClick = Function();

class PlayCard extends StatelessWidget {
  const PlayCard(
      {super.key,
      required this.label,
      required this.onClick,
      required this.icon});

  final String label;
  final OnClick onClick;
  final IconData icon;

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
            borderRadius: BorderRadius.circular(50),
          ),
          child: Column(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 50,
                  color: GameColor.secondaryBackgroundColor,
                ),
              ),
              Text(
                textAlign: TextAlign.center,
                label,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                  color: GameColor.primaryBackgroundColor,
                ),
              ),
              verticalSpaceMedium,
            ],
          ),
        ),
      ),
    );
  }
}
