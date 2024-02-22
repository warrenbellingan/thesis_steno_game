import 'package:flutter/material.dart';

import '../common/ui_helpers.dart';
import '../constants/game_color.dart';

class GamePasswordTextField extends StatefulWidget {
  GamePasswordTextField(
      {super.key, required this.controller, required this.label});

  final TextEditingController controller;
  final String label;
  bool isObscure = true;

  @override
  State<GamePasswordTextField> createState() => _GamePasswordTextFieldState();
}

class _GamePasswordTextFieldState extends State<GamePasswordTextField> {
  void onClick() {
    setState(() {
      widget.isObscure = !widget.isObscure;
    });
  }

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
            controller: widget.controller,
            keyboardType: TextInputType.visiblePassword,
            obscureText: widget.isObscure,
            decoration: InputDecoration(
              fillColor: GameColor.primaryBackgroundColor,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              labelText: widget.label,
              labelStyle: const TextStyle(
                color: Color(0xFF78746D),
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
              prefixIcon: Icon(Icons.lock, color: GameColor.primaryColor),
              suffixIcon: IconButton(
                onPressed: onClick,
                icon: Transform.scale(
                  scale: 1,
                  child: Icon(
                    widget.isObscure == true
                        ? Icons.remove_red_eye
                        : Icons.visibility_off,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
