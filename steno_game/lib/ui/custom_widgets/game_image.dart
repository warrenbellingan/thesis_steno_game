import 'package:flutter/material.dart';

class GameImage extends StatelessWidget {
  const GameImage({super.key, required this.path, this.size});

  final String path;
  final double? size;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size ?? 350,
      height: size ?? 350,
      child: Image.asset(path),
    );
  }
}
