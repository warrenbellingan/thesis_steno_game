import 'package:freezed_annotation/freezed_annotation.dart';

part 's_stroke.freezed.dart';

part 's_stroke.g.dart';

@Freezed()
class SStroke with _$SStroke {
  const factory SStroke({
    required String id,
    required String imageUrl,
  }) = _SStroke;

  factory SStroke.fromJson(Map<String, dynamic> json) =>
      _$SStrokeFromJson(json);
}
