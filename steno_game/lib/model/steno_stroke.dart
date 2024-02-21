import 'package:freezed_annotation/freezed_annotation.dart';

part 'steno_stroke.freezed.dart';

part 'steno_stroke.g.dart';

@Freezed()
class StenoStroke with _$StenoStroke {
  const factory StenoStroke({
    required String id,
    required String text,
    required String strokeImage,
  }) = _StenoStroke;

  factory StenoStroke.fromJson(Map<String, dynamic> json) =>
      _$StenoStrokeFromJson(json);
}
