import 'package:freezed_annotation/freezed_annotation.dart';

part 'multiplayer_stroke.freezed.dart';

part 'multiplayer_stroke.g.dart';

@Freezed()
class MultiplayerStroke with _$MultiplayerStroke {
  const factory MultiplayerStroke(
      {
        required String id,
        required String gameMaster,
        required String text,
        required String stroke,
        required String type,
        @Default(0) int status

      }) = _MultiplayerStroke;

  factory MultiplayerStroke.fromJson(Map<String, dynamic> json) => _$MultiplayerStrokeFromJson(json);
}
