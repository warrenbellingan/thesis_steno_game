import 'package:freezed_annotation/freezed_annotation.dart';

part 'steno_typing.freezed.dart';

part 'steno_typing.g.dart';

@Freezed()
class StenoTyping with _$StenoTyping {
  const factory StenoTyping({
    required String id,
    required String text,
    required String strokeImage,
  }) = _StenoTyping;

  factory StenoTyping.fromJson(Map<String, dynamic> json) =>
      _$StenoTypingFromJson(json);
}
