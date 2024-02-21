// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'text_quiz.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TextQuiz _$TextQuizFromJson(Map<String, dynamic> json) {
  return _TextQuiz.fromJson(json);
}

/// @nodoc
mixin _$TextQuiz {
  String get id => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TextQuizCopyWith<TextQuiz> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TextQuizCopyWith<$Res> {
  factory $TextQuizCopyWith(TextQuiz value, $Res Function(TextQuiz) then) =
      _$TextQuizCopyWithImpl<$Res, TextQuiz>;
  @useResult
  $Res call({String id, String text, String image, String description});
}

/// @nodoc
class _$TextQuizCopyWithImpl<$Res, $Val extends TextQuiz>
    implements $TextQuizCopyWith<$Res> {
  _$TextQuizCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
    Object? image = null,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TextQuizImplCopyWith<$Res>
    implements $TextQuizCopyWith<$Res> {
  factory _$$TextQuizImplCopyWith(
          _$TextQuizImpl value, $Res Function(_$TextQuizImpl) then) =
      __$$TextQuizImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String text, String image, String description});
}

/// @nodoc
class __$$TextQuizImplCopyWithImpl<$Res>
    extends _$TextQuizCopyWithImpl<$Res, _$TextQuizImpl>
    implements _$$TextQuizImplCopyWith<$Res> {
  __$$TextQuizImplCopyWithImpl(
      _$TextQuizImpl _value, $Res Function(_$TextQuizImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
    Object? image = null,
    Object? description = null,
  }) {
    return _then(_$TextQuizImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TextQuizImpl implements _TextQuiz {
  const _$TextQuizImpl(
      {required this.id,
      required this.text,
      required this.image,
      required this.description});

  factory _$TextQuizImpl.fromJson(Map<String, dynamic> json) =>
      _$$TextQuizImplFromJson(json);

  @override
  final String id;
  @override
  final String text;
  @override
  final String image;
  @override
  final String description;

  @override
  String toString() {
    return 'TextQuiz(id: $id, text: $text, image: $image, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TextQuizImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, text, image, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TextQuizImplCopyWith<_$TextQuizImpl> get copyWith =>
      __$$TextQuizImplCopyWithImpl<_$TextQuizImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TextQuizImplToJson(
      this,
    );
  }
}

abstract class _TextQuiz implements TextQuiz {
  const factory _TextQuiz(
      {required final String id,
      required final String text,
      required final String image,
      required final String description}) = _$TextQuizImpl;

  factory _TextQuiz.fromJson(Map<String, dynamic> json) =
      _$TextQuizImpl.fromJson;

  @override
  String get id;
  @override
  String get text;
  @override
  String get image;
  @override
  String get description;
  @override
  @JsonKey(ignore: true)
  _$$TextQuizImplCopyWith<_$TextQuizImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
