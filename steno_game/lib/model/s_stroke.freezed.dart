// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 's_stroke.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SStroke _$SStrokeFromJson(Map<String, dynamic> json) {
  return _SStroke.fromJson(json);
}

/// @nodoc
mixin _$SStroke {
  String get id => throw _privateConstructorUsedError;
  String get questionId => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  String get stroke => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SStrokeCopyWith<SStroke> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SStrokeCopyWith<$Res> {
  factory $SStrokeCopyWith(SStroke value, $Res Function(SStroke) then) =
      _$SStrokeCopyWithImpl<$Res, SStroke>;
  @useResult
  $Res call({String id, String questionId, String imageUrl, String stroke});
}

/// @nodoc
class _$SStrokeCopyWithImpl<$Res, $Val extends SStroke>
    implements $SStrokeCopyWith<$Res> {
  _$SStrokeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? questionId = null,
    Object? imageUrl = null,
    Object? stroke = null,
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
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      stroke: null == stroke
          ? _value.stroke
          : stroke // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SStrokeImplCopyWith<$Res> implements $SStrokeCopyWith<$Res> {
  factory _$$SStrokeImplCopyWith(
          _$SStrokeImpl value, $Res Function(_$SStrokeImpl) then) =
      __$$SStrokeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String questionId, String imageUrl, String stroke});
}

/// @nodoc
class __$$SStrokeImplCopyWithImpl<$Res>
    extends _$SStrokeCopyWithImpl<$Res, _$SStrokeImpl>
    implements _$$SStrokeImplCopyWith<$Res> {
  __$$SStrokeImplCopyWithImpl(
      _$SStrokeImpl _value, $Res Function(_$SStrokeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? questionId = null,
    Object? imageUrl = null,
    Object? stroke = null,
  }) {
    return _then(_$SStrokeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      questionId: null == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      stroke: null == stroke
          ? _value.stroke
          : stroke // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SStrokeImpl implements _SStroke {
  const _$SStrokeImpl(
      {required this.id,
      required this.questionId,
      required this.imageUrl,
      required this.stroke});

  factory _$SStrokeImpl.fromJson(Map<String, dynamic> json) =>
      _$$SStrokeImplFromJson(json);

  @override
  final String id;
  @override
  final String questionId;
  @override
  final String imageUrl;
  @override
  final String stroke;

  @override
  String toString() {
    return 'SStroke(id: $id, questionId: $questionId, imageUrl: $imageUrl, stroke: $stroke)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SStrokeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.questionId, questionId) ||
                other.questionId == questionId) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.stroke, stroke) || other.stroke == stroke));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, questionId, imageUrl, stroke);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SStrokeImplCopyWith<_$SStrokeImpl> get copyWith =>
      __$$SStrokeImplCopyWithImpl<_$SStrokeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SStrokeImplToJson(
      this,
    );
  }
}

abstract class _SStroke implements SStroke {
  const factory _SStroke(
      {required final String id,
      required final String questionId,
      required final String imageUrl,
      required final String stroke}) = _$SStrokeImpl;

  factory _SStroke.fromJson(Map<String, dynamic> json) = _$SStrokeImpl.fromJson;

  @override
  String get id;
  @override
  String get questionId;
  @override
  String get imageUrl;
  @override
  String get stroke;
  @override
  @JsonKey(ignore: true)
  _$$SStrokeImplCopyWith<_$SStrokeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
