import 'package:freezed_annotation/freezed_annotation.dart';

part 'quizzes.freezed.dart';

part 'quizzes.g.dart';

@Freezed()
class Quizzes with _$Quizzes {
  const factory Quizzes({
    required String id,
    required String title,
  }) = _Quizzes;

  factory Quizzes.fromJson(Map<String, dynamic> json) =>
      _$QuizzesFromJson(json);
}
