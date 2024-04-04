import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:steno_game/ui/constants/game_color.dart';

class GameNetworkImage extends StatelessWidget {
  const GameNetworkImage(
      {super.key, required this.path, this.width, this.height});

  final String path;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: width ?? 350,
      height: height ?? 350,
      imageUrl: path,
      fit: BoxFit.cover,
      progressIndicatorBuilder: (context, url, progress) {
        return const Padding(
          padding: EdgeInsetsDirectional.all(200),
          child: CircularProgressIndicator(
            color: GameColor.primaryColor,
          ),
        );
      },
      errorWidget: (context, url, error) => const Icon(
        Icons.error_outline_sharp,
        color: Colors.red,
      ),
    );
  }
}
