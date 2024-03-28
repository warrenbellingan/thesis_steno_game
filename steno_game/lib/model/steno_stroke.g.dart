// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'steno_stroke.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StenoStrokeImpl _$$StenoStrokeImplFromJson(Map<String, dynamic> json) =>
    _$StenoStrokeImpl(
      id: json['id'] as String,
      text: json['text'] as String,
      strokeImage: json['strokeImage'] as String,
      filePath: json['filePath'] as String,
      status: json['status'] as int,
    );

Map<String, dynamic> _$$StenoStrokeImplToJson(_$StenoStrokeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'strokeImage': instance.strokeImage,
      'filePath': instance.filePath,
      'status': instance.status,
    };
