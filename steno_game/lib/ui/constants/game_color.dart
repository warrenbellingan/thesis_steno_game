import 'package:flutter/material.dart';

class GameColor {
  GameColor._();

  static const primaryGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color(0xFFFC7D53),
      Color(0xFFFD4027),
      Color(0xFFFD1010),
    ],
  );

  static const secondaryGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color(0xFFF87B51),
      Color(0xFFCC4736),
      Color(0xFFD22727),
    ],
  );

  static const primaryColor = Color(0xFFD94720);
  static const secondaryColor = Color(0xFF505050);
  static const tertiaryColor = Color(0xFFFA8269);

  static const primaryBackgroundColor = Color(0xF0F1F0F0);
  static const secondaryBackgroundColor = Color(0xF0BB0707);
}
