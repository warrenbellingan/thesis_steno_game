import '../constants/game_color.dart';
import 'package:flutter/material.dart';

class GameLoading extends StatelessWidget {
  const GameLoading({super.key, this.label = "Loading"});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const LinearProgressIndicator(
              color: GameColor.primaryColor,
              backgroundColor: GameColor.secondaryColor,
            ),
            Text(
              label,
              style: TextStyle(
                fontSize: 18,
                letterSpacing: 2,
                wordSpacing: 2,
                fontWeight: FontWeight.bold,
                color: GameColor.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
