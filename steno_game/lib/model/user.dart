import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

part 'user.g.dart';

@Freezed()
class User with _$User {
  const factory User(
      {required String id,
      required String name,
      required String email,
      required String role,
      String? image,
      @Default(0) int typingSpeed,
      @Default(0) double typingAccuracy,
      @Default([]) List completedLevels,
      @Default([]) List achievements,
      @Default(0) int score,
      @Default([]) List friends,
      @Default(1) int level,
      @Default(0) int levelProgress}) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
