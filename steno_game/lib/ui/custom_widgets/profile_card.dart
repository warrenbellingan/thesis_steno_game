import '../constants/game_color.dart';
import 'package:flutter/material.dart';

import '../common/ui_helpers.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key, required this.title, required this.stats});

  final String title;
  final String stats;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: 140,
      margin: const EdgeInsets.symmetric(horizontal: 3, vertical: 4),
      decoration: BoxDecoration(
        color: GameColor.primaryColor,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [primaryShadow()],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w700,
              letterSpacing: 2,
            ),
          ),
          Text(
            stats,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
