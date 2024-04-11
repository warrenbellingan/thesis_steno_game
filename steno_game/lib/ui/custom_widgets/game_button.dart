import '../common/ui_helpers.dart';
import '../constants/game_color.dart';
import 'package:flutter/material.dart';

typedef OnClick = Function();

class GameButton extends StatelessWidget {
  const GameButton(
      {super.key,
      required this.text,
      required this.onClick,
      required this.isLoading});

  final String text;
  final OnClick onClick;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: GameColor.secondaryBackgroundColor,
          boxShadow: [
            primaryShadow(),
          ]),
      child: ElevatedButton(
        onPressed: onClick,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
        ),
        child: isLoading
            ? const CircularProgressIndicator(
          backgroundColor: GameColor.secondaryBackgroundColor,
                color: Colors.white,
              )
            : Text(
                text,
                style: const TextStyle(
                  letterSpacing: 1,
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
      ),
    );
  }
}
