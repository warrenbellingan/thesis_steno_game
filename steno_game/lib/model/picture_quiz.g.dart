// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'picture_quiz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PictureQuizImpl _$$PictureQuizImplFromJson(Map<String, dynamic> json) =>
    _$PictureQuizImpl(
      id: json['id'] as String,
      stroke: json['stroke'] as String,
      choices:
          (json['choices'] as List<dynamic>).map((e) => e as String).toList(),
      answer: json['answer'] as String,
    );

Map<String, dynamic> _$$PictureQuizImplToJson(_$PictureQuizImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'stroke': instance.stroke,
      'choices': instance.choices,
      'answer': instance.answer,
    };
