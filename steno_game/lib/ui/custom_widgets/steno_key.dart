
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StenoKey extends StatefulWidget {
  StenoKey({super.key, this.width = double.infinity, this.height = 40});

  double width;
  double height;
  @override
  State<StenoKey> createState() => _StenoKeyState();
}

class _StenoKeyState extends State<StenoKey> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(1),
      color: Colors.red,
      height: widget.height,
      width: widget.width,
    );
  }
}
