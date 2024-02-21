import 'package:freezed_annotation/freezed_annotation.dart';

part 'lesson.freezed.dart';

part 'lesson.g.dart';

@Freezed()
class Lesson with _$Lesson {
  const factory Lesson(
      {required String id,
      required String title,
      required List topics,
      required List quizzes}) = _Lesson;

  factory Lesson.fromJson(Map<String, dynamic> json) => _$LessonFromJson(json);
}
