// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer_stroke.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AnswerStrokeImpl _$$AnswerStrokeImplFromJson(Map<String, dynamic> json) =>
    _$AnswerStrokeImpl(
      id: json['id'] as String,
      questionId: json['questionId'] as String,
      data: json['data'] as String,
      stroke: json['stroke'] as String?,
    );

Map<String, dynamic> _$$AnswerStrokeImplToJson(_$AnswerStrokeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'questionId': instance.questionId,
      'data': instance.data,
      'stroke': instance.stroke,
    };
