import 'package:freezed_annotation/freezed_annotation.dart';

part 'picture_topic.freezed.dart';

part 'picture_topic.g.dart';

@Freezed()
class PictureTopic with _$PictureTopic {
  const factory PictureTopic(
      {required String id,
      required String text,
      required String image,
      required String description}) = _PictureTopic;

  factory PictureTopic.fromJson(Map<String, dynamic> json) =>
      _$PictureTopicFromJson(json);
}
