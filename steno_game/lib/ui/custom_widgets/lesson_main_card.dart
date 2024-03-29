import 'package:steno_game/ui/custom_widgets/game_icon_button.dart';

import '../constants/game_color.dart';
import 'package:flutter/material.dart';

import '../common/ui_helpers.dart';

typedef OnClick = Function();

class LessonMainCard extends StatelessWidget {
  const LessonMainCard({
    super.key,
    required this.label,
    required this.onLessonClick,
    required this.onEditClick,
    required this.onDeleteClick,
    required this.isInstructor,
  });

  final String label;
  final OnClick onLessonClick;
  final OnClick onEditClick;
  final OnClick onDeleteClick;
  final bool isInstructor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: onLessonClick,
          child: AbsorbPointer(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
              padding:
                  const EdgeInsets.only(top: 25, right: 8, left: 16, bottom: 4),
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: GameColor.fortyColor,
                  boxShadow: [
                    primaryShadow(),
                  ]),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  label,
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                    wordSpacing: 3,
                  ),
                ),
              ),
            ),
          ),
        ),
        if (isInstructor)
          Container(
            margin: const EdgeInsets.only(right: 10, top: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GameIconButton(
                  onClick: onEditClick,
                  icon: Icons.edit_rounded,
                  size: 30,
                ),
                GameIconButton(
                  onClick: onDeleteClick,
                  icon: Icons.delete_rounded,
                  size: 30,
                ),
              ],
            ),
          ),
      ],
    );
  }
}
