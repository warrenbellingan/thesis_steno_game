// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 's_text.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SText _$STextFromJson(Map<String, dynamic> json) {
  return _SText.fromJson(json);
}

/// @nodoc
mixin _$SText {
  String get id => throw _privateConstructorUsedError;
  String get questionId => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $STextCopyWith<SText> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $STextCopyWith<$Res> {
  factory $STextCopyWith(SText value, $Res Function(SText) then) =
      _$STextCopyWithImpl<$Res, SText>;
  @useResult
  $Res call({String id, String questionId, String text});
}

/// @nodoc
class _$STextCopyWithImpl<$Res, $Val extends SText>
    implements $STextCopyWith<$Res> {
  _$STextCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? questionId = null,
    Object? text = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      questionId: null == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$STextImplCopyWith<$Res> implements $STextCopyWith<$Res> {
  factory _$$STextImplCopyWith(
          _$STextImpl value, $Res Function(_$STextImpl) then) =
      __$$STextImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String questionId, String text});
}

/// @nodoc
class __$$STextImplCopyWithImpl<$Res>
    extends _$STextCopyWithImpl<$Res, _$STextImpl>
    implements _$$STextImplCopyWith<$Res> {
  __$$STextImplCopyWithImpl(
      _$STextImpl _value, $Res Function(_$STextImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? questionId = null,
    Object? text = null,
  }) {
    return _then(_$STextImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      questionId: null == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$STextImpl implements _SText {
  const _$STextImpl(
      {required this.id, required this.questionId, required this.text});

  factory _$STextImpl.fromJson(Map<String, dynamic> json) =>
      _$$STextImplFromJson(json);

  @override
  final String id;
  @override
  final String questionId;
  @override
  final String text;

  @override
  String toString() {
    return 'SText(id: $id, questionId: $questionId, text: $text)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$STextImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.questionId, questionId) ||
                other.questionId == questionId) &&
            (identical(other.text, text) || other.text == text));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, questionId, text);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$STextImplCopyWith<_$STextImpl> get copyWith =>
      __$$STextImplCopyWithImpl<_$STextImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$STextImplToJson(
      this,
    );
  }
}

abstract class _SText implements SText {
  const factory _SText(
      {required final String id,
      required final String questionId,
      required final String text}) = _$STextImpl;

  factory _SText.fromJson(Map<String, dynamic> json) = _$STextImpl.fromJson;

  @override
  String get id;
  @override
  String get questionId;
  @override
  String get text;
  @override
  @JsonKey(ignore: true)
  _$$STextImplCopyWith<_$STextImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
