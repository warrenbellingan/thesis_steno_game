import '../constants/game_color.dart';
import 'package:flutter/material.dart';

class GameTitleText extends StatelessWidget {
  const GameTitleText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: GameColor.secondaryBackgroundColor,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(80),
          bottomLeft: Radius.circular(80),
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 30,
          ),
          Text(
            text,
            style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
                letterSpacing: 5,
                wordSpacing: 5),
          ),
          SizedBox(
            height: 35,
          )
        ],
      ),
    );
  }
}
