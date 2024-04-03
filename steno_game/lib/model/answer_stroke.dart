import 'package:freezed_annotation/freezed_annotation.dart';

part 'answer_stroke.freezed.dart';

part 'answer_stroke.g.dart';

@Freezed()
class AnswerStroke with _$AnswerStroke {
  const factory AnswerStroke({
    required String id,
    required String questionId,
    required String data,
    required String? stroke,
  }) = _AnswerStroke;

  factory AnswerStroke.fromJson(Map<String, dynamic> json) =>
      _$AnswerStrokeFromJson(json);
}
