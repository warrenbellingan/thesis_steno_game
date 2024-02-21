// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'typing_text.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TypingText _$TypingTextFromJson(Map<String, dynamic> json) {
  return _TypingText.fromJson(json);
}

/// @nodoc
mixin _$TypingText {
  String get id => throw _privateConstructorUsedError;
  List<String> get text => throw _privateConstructorUsedError;
  List<String> get typingKeys => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TypingTextCopyWith<TypingText> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TypingTextCopyWith<$Res> {
  factory $TypingTextCopyWith(
          TypingText value, $Res Function(TypingText) then) =
      _$TypingTextCopyWithImpl<$Res, TypingText>;
  @useResult
  $Res call({String id, List<String> text, List<String> typingKeys});
}

/// @nodoc
class _$TypingTextCopyWithImpl<$Res, $Val extends TypingText>
    implements $TypingTextCopyWith<$Res> {
  _$TypingTextCopyWithImpl(this._value, this._then);

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
              as List<String>,
      typingKeys: null == typingKeys
          ? _value.typingKeys
          : typingKeys // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TypingTextImplCopyWith<$Res>
    implements $TypingTextCopyWith<$Res> {
  factory _$$TypingTextImplCopyWith(
          _$TypingTextImpl value, $Res Function(_$TypingTextImpl) then) =
      __$$TypingTextImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, List<String> text, List<String> typingKeys});
}

/// @nodoc
class __$$TypingTextImplCopyWithImpl<$Res>
    extends _$TypingTextCopyWithImpl<$Res, _$TypingTextImpl>
    implements _$$TypingTextImplCopyWith<$Res> {
  __$$TypingTextImplCopyWithImpl(
      _$TypingTextImpl _value, $Res Function(_$TypingTextImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
    Object? typingKeys = null,
  }) {
    return _then(_$TypingTextImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value._text
          : text // ignore: cast_nullable_to_non_nullable
              as List<String>,
      typingKeys: null == typingKeys
          ? _value._typingKeys
          : typingKeys // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TypingTextImpl implements _TypingText {
  const _$TypingTextImpl(
      {required this.id,
      required final List<String> text,
      required final List<String> typingKeys})
      : _text = text,
        _typingKeys = typingKeys;

  factory _$TypingTextImpl.fromJson(Map<String, dynamic> json) =>
      _$$TypingTextImplFromJson(json);

  @override
  final String id;
  final List<String> _text;
  @override
  List<String> get text {
    if (_text is EqualUnmodifiableListView) return _text;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_text);
  }

  final List<String> _typingKeys;
  @override
  List<String> get typingKeys {
    if (_typingKeys is EqualUnmodifiableListView) return _typingKeys;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_typingKeys);
  }

  @override
  String toString() {
    return 'TypingText(id: $id, text: $text, typingKeys: $typingKeys)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TypingTextImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._text, _text) &&
            const DeepCollectionEquality()
                .equals(other._typingKeys, _typingKeys));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(_text),
      const DeepCollectionEquality().hash(_typingKeys));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TypingTextImplCopyWith<_$TypingTextImpl> get copyWith =>
      __$$TypingTextImplCopyWithImpl<_$TypingTextImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TypingTextImplToJson(
      this,
    );
  }
}

abstract class _TypingText implements TypingText {
  const factory _TypingText(
      {required final String id,
      required final List<String> text,
      required final List<String> typingKeys}) = _$TypingTextImpl;

  factory _TypingText.fromJson(Map<String, dynamic> json) =
      _$TypingTextImpl.fromJson;

  @override
  String get id;
  @override
  List<String> get text;
  @override
  List<String> get typingKeys;
  @override
  @JsonKey(ignore: true)
  _$$TypingTextImplCopyWith<_$TypingTextImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
