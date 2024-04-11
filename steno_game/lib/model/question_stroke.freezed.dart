// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'question_stroke.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

QuestionStroke _$QuestionStrokeFromJson(Map<String, dynamic> json) {
  return _QuestionStroke.fromJson(json);
}

/// @nodoc
mixin _$QuestionStroke {
  String get id => throw _privateConstructorUsedError;
  String get data => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String? get strokeText => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuestionStrokeCopyWith<QuestionStroke> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionStrokeCopyWith<$Res> {
  factory $QuestionStrokeCopyWith(
          QuestionStroke value, $Res Function(QuestionStroke) then) =
      _$QuestionStrokeCopyWithImpl<$Res, QuestionStroke>;
  @useResult
  $Res call({String id, String data, String type, String? strokeText});
}

/// @nodoc
class _$QuestionStrokeCopyWithImpl<$Res, $Val extends QuestionStroke>
    implements $QuestionStrokeCopyWith<$Res> {
  _$QuestionStrokeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? data = null,
    Object? type = null,
    Object? strokeText = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      strokeText: freezed == strokeText
          ? _value.strokeText
          : strokeText // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuestionStrokeImplCopyWith<$Res>
    implements $QuestionStrokeCopyWith<$Res> {
  factory _$$QuestionStrokeImplCopyWith(_$QuestionStrokeImpl value,
          $Res Function(_$QuestionStrokeImpl) then) =
      __$$QuestionStrokeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String data, String type, String? strokeText});
}

/// @nodoc
class __$$QuestionStrokeImplCopyWithImpl<$Res>
    extends _$QuestionStrokeCopyWithImpl<$Res, _$QuestionStrokeImpl>
    implements _$$QuestionStrokeImplCopyWith<$Res> {
  __$$QuestionStrokeImplCopyWithImpl(
      _$QuestionStrokeImpl _value, $Res Function(_$QuestionStrokeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? data = null,
    Object? type = null,
    Object? strokeText = freezed,
  }) {
    return _then(_$QuestionStrokeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      strokeText: freezed == strokeText
          ? _value.strokeText
          : strokeText // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuestionStrokeImpl implements _QuestionStroke {
  const _$QuestionStrokeImpl(
      {required this.id,
      required this.data,
      required this.type,
      required this.strokeText});

  factory _$QuestionStrokeImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuestionStrokeImplFromJson(json);

  @override
  final String id;
  @override
  final String data;
  @override
  final String type;
  @override
  final String? strokeText;

  @override
  String toString() {
    return 'QuestionStroke(id: $id, data: $data, type: $type, strokeText: $strokeText)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestionStrokeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.strokeText, strokeText) ||
                other.strokeText == strokeText));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, data, type, strokeText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuestionStrokeImplCopyWith<_$QuestionStrokeImpl> get copyWith =>
      __$$QuestionStrokeImplCopyWithImpl<_$QuestionStrokeImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuestionStrokeImplToJson(
      this,
    );
  }
}

abstract class _QuestionStroke implements QuestionStroke {
  const factory _QuestionStroke(
      {required final String id,
      required final String data,
      required final String type,
      required final String? strokeText}) = _$QuestionStrokeImpl;

  factory _QuestionStroke.fromJson(Map<String, dynamic> json) =
      _$QuestionStrokeImpl.fromJson;

  @override
  String get id;
  @override
  String get data;
  @override
  String get type;
  @override
  String? get strokeText;
  @override
  @JsonKey(ignore: true)
  _$$QuestionStrokeImplCopyWith<_$QuestionStrokeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
