// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'steno_stroke.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StenoStroke _$StenoStrokeFromJson(Map<String, dynamic> json) {
  return _StenoStroke.fromJson(json);
}

/// @nodoc
mixin _$StenoStroke {
  String get id => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  String get strokeImage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StenoStrokeCopyWith<StenoStroke> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StenoStrokeCopyWith<$Res> {
  factory $StenoStrokeCopyWith(
          StenoStroke value, $Res Function(StenoStroke) then) =
      _$StenoStrokeCopyWithImpl<$Res, StenoStroke>;
  @useResult
  $Res call({String id, String text, String strokeImage});
}

/// @nodoc
class _$StenoStrokeCopyWithImpl<$Res, $Val extends StenoStroke>
    implements $StenoStrokeCopyWith<$Res> {
  _$StenoStrokeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
    Object? strokeImage = null,
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
      strokeImage: null == strokeImage
          ? _value.strokeImage
          : strokeImage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StenoStrokeImplCopyWith<$Res>
    implements $StenoStrokeCopyWith<$Res> {
  factory _$$StenoStrokeImplCopyWith(
          _$StenoStrokeImpl value, $Res Function(_$StenoStrokeImpl) then) =
      __$$StenoStrokeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String text, String strokeImage});
}

/// @nodoc
class __$$StenoStrokeImplCopyWithImpl<$Res>
    extends _$StenoStrokeCopyWithImpl<$Res, _$StenoStrokeImpl>
    implements _$$StenoStrokeImplCopyWith<$Res> {
  __$$StenoStrokeImplCopyWithImpl(
      _$StenoStrokeImpl _value, $Res Function(_$StenoStrokeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
    Object? strokeImage = null,
  }) {
    return _then(_$StenoStrokeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      strokeImage: null == strokeImage
          ? _value.strokeImage
          : strokeImage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StenoStrokeImpl implements _StenoStroke {
  const _$StenoStrokeImpl(
      {required this.id, required this.text, required this.strokeImage});

  factory _$StenoStrokeImpl.fromJson(Map<String, dynamic> json) =>
      _$$StenoStrokeImplFromJson(json);

  @override
  final String id;
  @override
  final String text;
  @override
  final String strokeImage;

  @override
  String toString() {
    return 'StenoStroke(id: $id, text: $text, strokeImage: $strokeImage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StenoStrokeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.strokeImage, strokeImage) ||
                other.strokeImage == strokeImage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, text, strokeImage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StenoStrokeImplCopyWith<_$StenoStrokeImpl> get copyWith =>
      __$$StenoStrokeImplCopyWithImpl<_$StenoStrokeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StenoStrokeImplToJson(
      this,
    );
  }
}

abstract class _StenoStroke implements StenoStroke {
  const factory _StenoStroke(
      {required final String id,
      required final String text,
      required final String strokeImage}) = _$StenoStrokeImpl;

  factory _StenoStroke.fromJson(Map<String, dynamic> json) =
      _$StenoStrokeImpl.fromJson;

  @override
  String get id;
  @override
  String get text;
  @override
  String get strokeImage;
  @override
  @JsonKey(ignore: true)
  _$$StenoStrokeImplCopyWith<_$StenoStrokeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
