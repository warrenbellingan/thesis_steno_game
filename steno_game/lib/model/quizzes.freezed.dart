// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quizzes.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Quizzes _$QuizzesFromJson(Map<String, dynamic> json) {
  return _Quizzes.fromJson(json);
}

/// @nodoc
mixin _$Quizzes {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuizzesCopyWith<Quizzes> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizzesCopyWith<$Res> {
  factory $QuizzesCopyWith(Quizzes value, $Res Function(Quizzes) then) =
      _$QuizzesCopyWithImpl<$Res, Quizzes>;
  @useResult
  $Res call({String id, String title});
}

/// @nodoc
class _$QuizzesCopyWithImpl<$Res, $Val extends Quizzes>
    implements $QuizzesCopyWith<$Res> {
  _$QuizzesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuizzesImplCopyWith<$Res> implements $QuizzesCopyWith<$Res> {
  factory _$$QuizzesImplCopyWith(
          _$QuizzesImpl value, $Res Function(_$QuizzesImpl) then) =
      __$$QuizzesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String title});
}

/// @nodoc
class __$$QuizzesImplCopyWithImpl<$Res>
    extends _$QuizzesCopyWithImpl<$Res, _$QuizzesImpl>
    implements _$$QuizzesImplCopyWith<$Res> {
  __$$QuizzesImplCopyWithImpl(
      _$QuizzesImpl _value, $Res Function(_$QuizzesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
  }) {
    return _then(_$QuizzesImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuizzesImpl implements _Quizzes {
  const _$QuizzesImpl({required this.id, required this.title});

  factory _$QuizzesImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuizzesImplFromJson(json);

  @override
  final String id;
  @override
  final String title;

  @override
  String toString() {
    return 'Quizzes(id: $id, title: $title)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizzesImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizzesImplCopyWith<_$QuizzesImpl> get copyWith =>
      __$$QuizzesImplCopyWithImpl<_$QuizzesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuizzesImplToJson(
      this,
    );
  }
}

abstract class _Quizzes implements Quizzes {
  const factory _Quizzes(
      {required final String id, required final String title}) = _$QuizzesImpl;

  factory _Quizzes.fromJson(Map<String, dynamic> json) = _$QuizzesImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  @JsonKey(ignore: true)
  _$$QuizzesImplCopyWith<_$QuizzesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
