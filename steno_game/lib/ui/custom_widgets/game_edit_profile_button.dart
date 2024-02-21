import 'package:flutter/material.dart';

import '../common/ui_helpers.dart';

typedef OnClick = Function();

class GameEditProfileButton extends StatelessWidget {
  const GameEditProfileButton(
      {super.key, required this.title, required this.onclick});

  final String title;
  final OnClick onclick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onclick,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 25, vertical: 4),
        padding: EdgeInsets.symmetric(vertical: 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            primaryShadow(),
          ],
          border: Border.all(
            color: Colors.black,
            style: BorderStyle.solid,
            width: 2,
          ),
        ),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.5,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
