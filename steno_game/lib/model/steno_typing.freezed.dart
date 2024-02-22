// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'steno_typing.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StenoTyping _$StenoTypingFromJson(Map<String, dynamic> json) {
  return _StenoTyping.fromJson(json);
}

/// @nodoc
mixin _$StenoTyping {
  String get id => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  String get strokeImage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StenoTypingCopyWith<StenoTyping> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StenoTypingCopyWith<$Res> {
  factory $StenoTypingCopyWith(
          StenoTyping value, $Res Function(StenoTyping) then) =
      _$StenoTypingCopyWithImpl<$Res, StenoTyping>;
  @useResult
  $Res call({String id, String text, String strokeImage});
}

/// @nodoc
class _$StenoTypingCopyWithImpl<$Res, $Val extends StenoTyping>
    implements $StenoTypingCopyWith<$Res> {
  _$StenoTypingCopyWithImpl(this._value, this._then);

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
abstract class _$$StenoTypingImplCopyWith<$Res>
    implements $StenoTypingCopyWith<$Res> {
  factory _$$StenoTypingImplCopyWith(
          _$StenoTypingImpl value, $Res Function(_$StenoTypingImpl) then) =
      __$$StenoTypingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String text, String strokeImage});
}

/// @nodoc
class __$$StenoTypingImplCopyWithImpl<$Res>
    extends _$StenoTypingCopyWithImpl<$Res, _$StenoTypingImpl>
    implements _$$StenoTypingImplCopyWith<$Res> {
  __$$StenoTypingImplCopyWithImpl(
      _$StenoTypingImpl _value, $Res Function(_$StenoTypingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
    Object? strokeImage = null,
  }) {
    return _then(_$StenoTypingImpl(
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
class _$StenoTypingImpl implements _StenoTyping {
  const _$StenoTypingImpl(
      {required this.id, required this.text, required this.strokeImage});

  factory _$StenoTypingImpl.fromJson(Map<String, dynamic> json) =>
      _$$StenoTypingImplFromJson(json);

  @override
  final String id;
  @override
  final String text;
  @override
  final String strokeImage;

  @override
  String toString() {
    return 'StenoTyping(id: $id, text: $text, strokeImage: $strokeImage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StenoTypingImpl &&
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
  _$$StenoTypingImplCopyWith<_$StenoTypingImpl> get copyWith =>
      __$$StenoTypingImplCopyWithImpl<_$StenoTypingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StenoTypingImplToJson(
      this,
    );
  }
}

abstract class _StenoTyping implements StenoTyping {
  const factory _StenoTyping(
      {required final String id,
      required final String text,
      required final String strokeImage}) = _$StenoTypingImpl;

  factory _StenoTyping.fromJson(Map<String, dynamic> json) =
      _$StenoTypingImpl.fromJson;

  @override
  String get id;
  @override
  String get text;
  @override
  String get strokeImage;
  @override
  @JsonKey(ignore: true)
  _$$StenoTypingImplCopyWith<_$StenoTypingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
