// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'multiplayer_stroke.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MultiplayerStrokeImpl _$$MultiplayerStrokeImplFromJson(
        Map<String, dynamic> json) =>
    _$MultiplayerStrokeImpl(
      id: json['id'] as String,
      gameMaster: json['gameMaster'] as String,
      text: json['text'] as String,
      stroke: json['stroke'] as String,
      type: json['type'] as String,
      status: json['status'] as int? ?? 0,
    );

Map<String, dynamic> _$$MultiplayerStrokeImplToJson(
        _$MultiplayerStrokeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'gameMaster': instance.gameMaster,
      'text': instance.text,
      'stroke': instance.stroke,
      'type': instance.type,
      'status': instance.status,
    };
