// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'answer_stroke.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AnswerStroke _$AnswerStrokeFromJson(Map<String, dynamic> json) {
  return _AnswerStroke.fromJson(json);
}

/// @nodoc
mixin _$AnswerStroke {
  String get id => throw _privateConstructorUsedError;
  String get questionId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get data => throw _privateConstructorUsedError;
  String? get stroke => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnswerStrokeCopyWith<AnswerStroke> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnswerStrokeCopyWith<$Res> {
  factory $AnswerStrokeCopyWith(
          AnswerStroke value, $Res Function(AnswerStroke) then) =
      _$AnswerStrokeCopyWithImpl<$Res, AnswerStroke>;
  @useResult
  $Res call(
      {String id,
      String questionId,
      String userId,
      String data,
      String? stroke});
}

/// @nodoc
class _$AnswerStrokeCopyWithImpl<$Res, $Val extends AnswerStroke>
    implements $AnswerStrokeCopyWith<$Res> {
  _$AnswerStrokeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? questionId = null,
    Object? userId = null,
    Object? data = null,
    Object? stroke = freezed,
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
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String,
      stroke: freezed == stroke
          ? _value.stroke
          : stroke // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnswerStrokeImplCopyWith<$Res>
    implements $AnswerStrokeCopyWith<$Res> {
  factory _$$AnswerStrokeImplCopyWith(
          _$AnswerStrokeImpl value, $Res Function(_$AnswerStrokeImpl) then) =
      __$$AnswerStrokeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String questionId,
      String userId,
      String data,
      String? stroke});
}

/// @nodoc
class __$$AnswerStrokeImplCopyWithImpl<$Res>
    extends _$AnswerStrokeCopyWithImpl<$Res, _$AnswerStrokeImpl>
    implements _$$AnswerStrokeImplCopyWith<$Res> {
  __$$AnswerStrokeImplCopyWithImpl(
      _$AnswerStrokeImpl _value, $Res Function(_$AnswerStrokeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? questionId = null,
    Object? userId = null,
    Object? data = null,
    Object? stroke = freezed,
  }) {
    return _then(_$AnswerStrokeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      questionId: null == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String,
      stroke: freezed == stroke
          ? _value.stroke
          : stroke // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnswerStrokeImpl implements _AnswerStroke {
  const _$AnswerStrokeImpl(
      {required this.id,
      required this.questionId,
      required this.userId,
      required this.data,
      required this.stroke});

  factory _$AnswerStrokeImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnswerStrokeImplFromJson(json);

  @override
  final String id;
  @override
  final String questionId;
  @override
  final String userId;
  @override
  final String data;
  @override
  final String? stroke;

  @override
  String toString() {
    return 'AnswerStroke(id: $id, questionId: $questionId, userId: $userId, data: $data, stroke: $stroke)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnswerStrokeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.questionId, questionId) ||
                other.questionId == questionId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.stroke, stroke) || other.stroke == stroke));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, questionId, userId, data, stroke);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnswerStrokeImplCopyWith<_$AnswerStrokeImpl> get copyWith =>
      __$$AnswerStrokeImplCopyWithImpl<_$AnswerStrokeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnswerStrokeImplToJson(
      this,
    );
  }
}

abstract class _AnswerStroke implements AnswerStroke {
  const factory _AnswerStroke(
      {required final String id,
      required final String questionId,
      required final String userId,
      required final String data,
      required final String? stroke}) = _$AnswerStrokeImpl;

  factory _AnswerStroke.fromJson(Map<String, dynamic> json) =
      _$AnswerStrokeImpl.fromJson;

  @override
  String get id;
  @override
  String get questionId;
  @override
  String get userId;
  @override
  String get data;
  @override
  String? get stroke;
  @override
  @JsonKey(ignore: true)
  _$$AnswerStrokeImplCopyWith<_$AnswerStrokeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
