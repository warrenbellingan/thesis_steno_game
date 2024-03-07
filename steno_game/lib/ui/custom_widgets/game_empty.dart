import 'package:flutter/material.dart';

class GameEmpty extends StatelessWidget {
  const GameEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          Icon(
            Icons.info_rounded,
            color: Colors.grey,
            size: 40,
          ),
          Text(
            "Empty",
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
