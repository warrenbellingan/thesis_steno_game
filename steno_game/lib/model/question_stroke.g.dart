// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_stroke.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuestionStrokeImpl _$$QuestionStrokeImplFromJson(Map<String, dynamic> json) =>
    _$QuestionStrokeImpl(
      id: json['id'] as String,
      data: json['data'] as String,
      type: json['type'] as String,
      strokeText: json['strokeText'] as String?,
    );

Map<String, dynamic> _$$QuestionStrokeImplToJson(
        _$QuestionStrokeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'data': instance.data,
      'type': instance.type,
      'strokeText': instance.strokeText,
    };
