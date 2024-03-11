import 'package:flutter/material.dart';

import '../common/ui_helpers.dart';

typedef OnClick = Function();

class GameSearchTextField extends StatelessWidget {
  const GameSearchTextField({
    super.key,
    required this.controller,
    required this.onClick,
  });

  final TextEditingController controller;
  final OnClick onClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      height: 50,
      decoration: BoxDecoration(boxShadow: [
        primaryShadow(),
      ], borderRadius: BorderRadius.circular(12)),
      child: TextField(
        cursorColor: Colors.black,
        keyboardType: TextInputType.name,
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: 'Search',
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              style: BorderStyle.solid,
              width: 2,
              color: Colors.black,
            ),
          ),
          suffixIcon: IconButton(
            icon: Icon(Icons.search),
            onPressed: onClick,
          ),
          suffixIconColor: Colors.black,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
