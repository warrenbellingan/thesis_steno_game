import 'package:freezed_annotation/freezed_annotation.dart';

part 'text_quiz.freezed.dart';

part 'text_quiz.g.dart';

@Freezed()
class TextQuiz with _$TextQuiz {
  const factory TextQuiz(
      {required String id,
      required String text,
      required String image,
      required String description}) = _TextQuiz;

  factory TextQuiz.fromJson(Map<String, dynamic> json) =>
      _$TextQuizFromJson(json);
}
