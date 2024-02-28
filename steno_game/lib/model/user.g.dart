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
      typingSpeed: json['typingSpeed'] as int? ?? 0,
      typingAccuracy: (json['typingAccuracy'] as num?)?.toDouble() ?? 0,
      completedLevels: json['completedLevels'] as List<dynamic>? ?? const [],
      achievements: json['achievements'] as List<dynamic>? ?? const [],
      score: json['score'] as int? ?? 0,
      friends: (json['friends'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      friendsRequest: (json['friendsRequest'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      addFriendRequest: (json['addFriendRequest'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      level: json['level'] as int? ?? 1,
      levelProgress: json['levelProgress'] as int? ?? 0,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'role': instance.role,
      'image': instance.image,
      'typingSpeed': instance.typingSpeed,
      'typingAccuracy': instance.typingAccuracy,
      'completedLevels': instance.completedLevels,
      'achievements': instance.achievements,
      'score': instance.score,
      'friends': instance.friends,
      'friendsRequest': instance.friendsRequest,
      'addFriendRequest': instance.addFriendRequest,
      'level': instance.level,
      'levelProgress': instance.levelProgress,
    };
