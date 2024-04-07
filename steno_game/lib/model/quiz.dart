import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz.freezed.dart';

part 'quiz.g.dart';

@Freezed()
class Quiz with _$Quiz {
  const factory Quiz({
    required String id,
    required String image,
    required List<String> choices,
    required String answer,
  }) = _Quiz;

  factory Quiz.fromJson(Map<String, dynamic> json) =>
      _$QuizFromJson(json);
}
