import '../constants/game_color.dart';
import 'package:flutter/material.dart';

import '../common/ui_helpers.dart';

typedef OnClick = Function();

class LessonMainCard extends StatelessWidget {
  const LessonMainCard({super.key, required this.label, required this.onClick});

  final String label;
  final OnClick onClick;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: AbsorbPointer(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          width: double.infinity,
          height: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
              boxShadow: [
                primaryShadow(),
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  label,
                  style: TextStyle(
                      fontSize: 24,
                      color: GameColor.secondaryColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 20,
                    decoration: BoxDecoration(
                      color: GameColor.primaryColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  Text(
                    '100%',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.7,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
