import 'package:freezed_annotation/freezed_annotation.dart';

part 'question_stroke.freezed.dart';

part 'question_stroke.g.dart';

@Freezed()
class QuestionStroke with _$QuestionStroke {
  const factory QuestionStroke({
    required String id,
    required String data,
    required String type,
    required String? strokeText,
  }) = _QuestionStroke;

  factory QuestionStroke.fromJson(Map<String, dynamic> json) =>
      _$QuestionStrokeFromJson(json);
}
