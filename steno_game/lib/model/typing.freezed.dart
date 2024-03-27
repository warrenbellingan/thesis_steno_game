// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'typing.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Typing _$TypingFromJson(Map<String, dynamic> json) {
  return _Typing.fromJson(json);
}

/// @nodoc
mixin _$Typing {
  String get id => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  String get typingKeys => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TypingCopyWith<Typing> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TypingCopyWith<$Res> {
  factory $TypingCopyWith(Typing value, $Res Function(Typing) then) =
      _$TypingCopyWithImpl<$Res, Typing>;
  @useResult
  $Res call({String id, String text, String typingKeys});
}

/// @nodoc
class _$TypingCopyWithImpl<$Res, $Val extends Typing>
    implements $TypingCopyWith<$Res> {
  _$TypingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
    Object? typingKeys = null,
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
      typingKeys: null == typingKeys
          ? _value.typingKeys
          : typingKeys // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TypingImplCopyWith<$Res> implements $TypingCopyWith<$Res> {
  factory _$$TypingImplCopyWith(
          _$TypingImpl value, $Res Function(_$TypingImpl) then) =
      __$$TypingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String text, String typingKeys});
}

/// @nodoc
class __$$TypingImplCopyWithImpl<$Res>
    extends _$TypingCopyWithImpl<$Res, _$TypingImpl>
    implements _$$TypingImplCopyWith<$Res> {
  __$$TypingImplCopyWithImpl(
      _$TypingImpl _value, $Res Function(_$TypingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
    Object? typingKeys = null,
  }) {
    return _then(_$TypingImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      typingKeys: null == typingKeys
          ? _value.typingKeys
          : typingKeys // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TypingImpl implements _Typing {
  const _$TypingImpl(
      {required this.id, required this.text, required this.typingKeys});

  factory _$TypingImpl.fromJson(Map<String, dynamic> json) =>
      _$$TypingImplFromJson(json);

  @override
  final String id;
  @override
  final String text;
  @override
  final String typingKeys;

  @override
  String toString() {
    return 'Typing(id: $id, text: $text, typingKeys: $typingKeys)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TypingImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.typingKeys, typingKeys) ||
                other.typingKeys == typingKeys));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, text, typingKeys);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TypingImplCopyWith<_$TypingImpl> get copyWith =>
      __$$TypingImplCopyWithImpl<_$TypingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TypingImplToJson(
      this,
    );
  }
}

abstract class _Typing implements Typing {
  const factory _Typing(
      {required final String id,
      required final String text,
      required final String typingKeys}) = _$TypingImpl;

  factory _Typing.fromJson(Map<String, dynamic> json) = _$TypingImpl.fromJson;

  @override
  String get id;
  @override
  String get text;
  @override
  String get typingKeys;
  @override
  @JsonKey(ignore: true)
  _$$TypingImplCopyWith<_$TypingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
