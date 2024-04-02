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
      status: json['status'] as int? ?? 0,
    );

Map<String, dynamic> _$$MultiplayerStrokeImplToJson(
        _$MultiplayerStrokeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'gameMaster': instance.gameMaster,
      'status': instance.status,
    };
