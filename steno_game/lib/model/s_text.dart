import 'package:freezed_annotation/freezed_annotation.dart';

part 's_text.freezed.dart';

part 's_text.g.dart';

@Freezed()
class SText with _$SText {
  const factory SText({
    required String id,
    required String questionId,
    required String text,
  }) = _SText;

  factory SText.fromJson(Map<String, dynamic> json) => _$STextFromJson(json);
}
