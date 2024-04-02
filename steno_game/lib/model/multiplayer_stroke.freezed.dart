// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'multiplayer_stroke.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MultiplayerStroke _$MultiplayerStrokeFromJson(Map<String, dynamic> json) {
  return _MultiplayerStroke.fromJson(json);
}

/// @nodoc
mixin _$MultiplayerStroke {
  String get id => throw _privateConstructorUsedError;
  String get gameMaster => throw _privateConstructorUsedError;
  int get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MultiplayerStrokeCopyWith<MultiplayerStroke> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MultiplayerStrokeCopyWith<$Res> {
  factory $MultiplayerStrokeCopyWith(
          MultiplayerStroke value, $Res Function(MultiplayerStroke) then) =
      _$MultiplayerStrokeCopyWithImpl<$Res, MultiplayerStroke>;
  @useResult
  $Res call({String id, String gameMaster, int status});
}

/// @nodoc
class _$MultiplayerStrokeCopyWithImpl<$Res, $Val extends MultiplayerStroke>
    implements $MultiplayerStrokeCopyWith<$Res> {
  _$MultiplayerStrokeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? gameMaster = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      gameMaster: null == gameMaster
          ? _value.gameMaster
          : gameMaster // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MultiplayerStrokeImplCopyWith<$Res>
    implements $MultiplayerStrokeCopyWith<$Res> {
  factory _$$MultiplayerStrokeImplCopyWith(_$MultiplayerStrokeImpl value,
          $Res Function(_$MultiplayerStrokeImpl) then) =
      __$$MultiplayerStrokeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String gameMaster, int status});
}

/// @nodoc
class __$$MultiplayerStrokeImplCopyWithImpl<$Res>
    extends _$MultiplayerStrokeCopyWithImpl<$Res, _$MultiplayerStrokeImpl>
    implements _$$MultiplayerStrokeImplCopyWith<$Res> {
  __$$MultiplayerStrokeImplCopyWithImpl(_$MultiplayerStrokeImpl _value,
      $Res Function(_$MultiplayerStrokeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? gameMaster = null,
    Object? status = null,
  }) {
    return _then(_$MultiplayerStrokeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      gameMaster: null == gameMaster
          ? _value.gameMaster
          : gameMaster // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MultiplayerStrokeImpl implements _MultiplayerStroke {
  const _$MultiplayerStrokeImpl(
      {required this.id, required this.gameMaster, this.status = 0});

  factory _$MultiplayerStrokeImpl.fromJson(Map<String, dynamic> json) =>
      _$$MultiplayerStrokeImplFromJson(json);

  @override
  final String id;
  @override
  final String gameMaster;
  @override
  @JsonKey()
  final int status;

  @override
  String toString() {
    return 'MultiplayerStroke(id: $id, gameMaster: $gameMaster, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MultiplayerStrokeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.gameMaster, gameMaster) ||
                other.gameMaster == gameMaster) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, gameMaster, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MultiplayerStrokeImplCopyWith<_$MultiplayerStrokeImpl> get copyWith =>
      __$$MultiplayerStrokeImplCopyWithImpl<_$MultiplayerStrokeImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MultiplayerStrokeImplToJson(
      this,
    );
  }
}

abstract class _MultiplayerStroke implements MultiplayerStroke {
  const factory _MultiplayerStroke(
      {required final String id,
      required final String gameMaster,
      final int status}) = _$MultiplayerStrokeImpl;

  factory _MultiplayerStroke.fromJson(Map<String, dynamic> json) =
      _$MultiplayerStrokeImpl.fromJson;

  @override
  String get id;
  @override
  String get gameMaster;
  @override
  int get status;
  @override
  @JsonKey(ignore: true)
  _$$MultiplayerStrokeImplCopyWith<_$MultiplayerStrokeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
