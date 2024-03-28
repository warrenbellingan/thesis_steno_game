import 'package:freezed_annotation/freezed_annotation.dart';

part 'typing.freezed.dart';

part 'typing.g.dart';

@Freezed()
class Typing with _$Typing {
  const factory Typing(
      {required String id,
      required String text,
      required String typingKeys}) = _Typing;

  factory Typing.fromJson(Map<String, dynamic> json) => _$TypingFromJson(json);
}
