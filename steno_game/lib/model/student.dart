import 'package:freezed_annotation/freezed_annotation.dart';

part 'student.freezed.dart';

part 'student.g.dart';

@Freezed()
class Student with _$Student {
  const factory Student({
    required String id,
    required String name,
    String? image,
    @Default(0) int score,
  }) = _Student;

  factory Student.fromJson(Map<String, dynamic> json) =>
      _$StudentFromJson(json);
}
