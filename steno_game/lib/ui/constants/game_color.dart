import 'package:flutter/material.dart';

class GameColor {
  GameColor._();

  static const primaryGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color(0xFFA554FA),
      Color(0xFF8D38E5),
      Color(0xFF7907F1),
    ],
  );

  static const secondaryGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color(0xFF8754C4),
      Color(0xFF5F0AB7),
      Color(0xFF5502AD),
    ],
  );

  static const primaryColor = Color(0xFF8D38E5);
  static const secondaryColor = Color(0xFF505050);
  static const tertiaryColor = Color(0xFFA554FA);

  static const primaryBackgroundColor = Color(0xF0F1F0F0);
  static const secondaryBackgroundColor = Color(0xFF5502AD);
}
