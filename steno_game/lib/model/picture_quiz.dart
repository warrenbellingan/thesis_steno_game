import 'package:freezed_annotation/freezed_annotation.dart';

part 'picture_quiz.freezed.dart';

part 'picture_quiz.g.dart';

@Freezed()
class PictureQuiz with _$PictureQuiz {
  const factory PictureQuiz(
      {required String id,
      required String text,
      required String image,
      required String description}) = _PictureQuiz;

  factory PictureQuiz.fromJson(Map<String, dynamic> json) =>
      _$PictureQuizFromJson(json);
}
