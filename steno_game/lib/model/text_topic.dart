import 'package:freezed_annotation/freezed_annotation.dart';

part 'text_topic.freezed.dart';

part 'text_topic.g.dart';

@Freezed()
class TextTopic with _$TextTopic {
  const factory TextTopic(
      {required String id,
      required String text,
      required String image,
      required String description}) = _TextTopic;

  factory TextTopic.fromJson(Map<String, dynamic> json) =>
      _$TextTopicFromJson(json);
}
