// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      role: json['role'] as String,
      image: json['image'] as String?,
      completedLevels: json['completedLevels'] as List<dynamic>? ?? const [],
      score: json['score'] as int? ?? 0,
      friends: (json['friends'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      friendsRequest: (json['friendsRequest'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'role': instance.role,
      'image': instance.image,
      'completedLevels': instance.completedLevels,
      'score': instance.score,
      'friends': instance.friends,
      'friendsRequest': instance.friendsRequest,
    };
