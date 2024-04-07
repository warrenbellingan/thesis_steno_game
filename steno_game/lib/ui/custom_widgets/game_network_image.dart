import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:steno_game/ui/constants/game_color.dart';

class GameNetworkImage extends StatelessWidget {
  const GameNetworkImage({super.key, required this.path, this.size});

  final String path;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: size ?? 350,
      height: size ?? 350,
      imageUrl: path,
      fit: BoxFit.cover,
      placeholder: (context, url) {
        return const Padding(
          padding: EdgeInsetsDirectional.all(130),
          child: CircularProgressIndicator(
            color: GameColor.primaryColor,
            strokeWidth: 5,
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
