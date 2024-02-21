import 'package:freezed_annotation/freezed_annotation.dart';

part 'typing_text.freezed.dart';

part 'typing_text.g.dart';

@Freezed()
class TypingText with _$TypingText {
  const factory TypingText(
      {required String id,
      required List<String> text,
      required List<String> typingKeys}) = _TypingText;

  factory TypingText.fromJson(Map<String, dynamic> json) =>
      _$TypingTextFromJson(json);
}
