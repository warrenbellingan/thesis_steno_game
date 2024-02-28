import 'package:flutter/material.dart';

class GameImage extends StatelessWidget {
  const GameImage({super.key, required this.path, this.width, this.height});

  final String path;
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 150,
      height: height ?? 150,
      child: Image.asset(path),
    );
  }
}
