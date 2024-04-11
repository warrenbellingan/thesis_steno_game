import 'package:flutter/material.dart';

import '../common/ui_helpers.dart';
import '../constants/game_color.dart';

class GameTextField extends StatelessWidget {
  const GameTextField(
      {super.key, required this.controller, required this.label, this.icon});

  final TextEditingController controller;
  final String label;
  final Icon? icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                primaryShadow(),
              ]),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            controller: controller,
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              labelText: label,
              floatingLabelStyle: const TextStyle(
                color: GameColor.primaryColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              labelStyle: const TextStyle(
                color: Color(0xFF78746D),
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
              prefixIcon: icon ?? const Icon(
                      Icons.email,
                      color: GameColor.primaryColor,
                    ),
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
