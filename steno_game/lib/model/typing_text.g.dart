// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'typing_text.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TypingTextImpl _$$TypingTextImplFromJson(Map<String, dynamic> json) =>
    _$TypingTextImpl(
      id: json['id'] as String,
      text: (json['text'] as List<dynamic>).map((e) => e as String).toList(),
      typingKeys: (json['typingKeys'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$TypingTextImplToJson(_$TypingTextImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'typingKeys': instance.typingKeys,
    };
