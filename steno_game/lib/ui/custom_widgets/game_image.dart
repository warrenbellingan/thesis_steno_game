import 'package:flutter/material.dart';

class GameImage extends StatelessWidget {
  const GameImage({super.key, required this.path, this.width, this.height});

  final String path;
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width == null ? 150 : width,
      height: height == null ? 150 : height,
      child: Image.asset(path),
    );
  }
}
