// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  List<dynamic> get completedLevels => throw _privateConstructorUsedError;
  List<dynamic> get achievements => throw _privateConstructorUsedError;
  int get score => throw _privateConstructorUsedError;
  List<String> get friends => throw _privateConstructorUsedError;
  List<String> get friendsRequest => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {String id,
      String name,
      String email,
      String role,
      String? image,
      List<dynamic> completedLevels,
      List<dynamic> achievements,
      int score,
      List<String> friends,
      List<String> friendsRequest});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? role = null,
    Object? image = freezed,
    Object? completedLevels = null,
    Object? achievements = null,
    Object? score = null,
    Object? friends = null,
    Object? friendsRequest = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      completedLevels: null == completedLevels
          ? _value.completedLevels
          : completedLevels // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      achievements: null == achievements
          ? _value.achievements
          : achievements // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      friends: null == friends
          ? _value.friends
          : friends // ignore: cast_nullable_to_non_nullable
              as List<String>,
      friendsRequest: null == friendsRequest
          ? _value.friendsRequest
          : friendsRequest // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String email,
      String role,
      String? image,
      List<dynamic> completedLevels,
      List<dynamic> achievements,
      int score,
      List<String> friends,
      List<String> friendsRequest});
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? role = null,
    Object? image = freezed,
    Object? completedLevels = null,
    Object? achievements = null,
    Object? score = null,
    Object? friends = null,
    Object? friendsRequest = null,
  }) {
    return _then(_$UserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      completedLevels: null == completedLevels
          ? _value._completedLevels
          : completedLevels // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      achievements: null == achievements
          ? _value._achievements
          : achievements // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      friends: null == friends
          ? _value._friends
          : friends // ignore: cast_nullable_to_non_nullable
              as List<String>,
      friendsRequest: null == friendsRequest
          ? _value._friendsRequest
          : friendsRequest // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserImpl implements _User {
  const _$UserImpl(
      {required this.id,
      required this.name,
      required this.email,
      required this.role,
      this.image,
      final List<dynamic> completedLevels = const [],
      final List<dynamic> achievements = const [],
      this.score = 0,
      final List<String> friends = const [],
      final List<String> friendsRequest = const []})
      : _completedLevels = completedLevels,
        _achievements = achievements,
        _friends = friends,
        _friendsRequest = friendsRequest;

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String email;
  @override
  final String role;
  @override
  final String? image;
  final List<dynamic> _completedLevels;
  @override
  @JsonKey()
  List<dynamic> get completedLevels {
    if (_completedLevels is EqualUnmodifiableListView) return _completedLevels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_completedLevels);
  }

  final List<dynamic> _achievements;
  @override
  @JsonKey()
  List<dynamic> get achievements {
    if (_achievements is EqualUnmodifiableListView) return _achievements;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_achievements);
  }

  @override
  @JsonKey()
  final int score;
  final List<String> _friends;
  @override
  @JsonKey()
  List<String> get friends {
    if (_friends is EqualUnmodifiableListView) return _friends;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_friends);
  }

  final List<String> _friendsRequest;
  @override
  @JsonKey()
  List<String> get friendsRequest {
    if (_friendsRequest is EqualUnmodifiableListView) return _friendsRequest;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_friendsRequest);
  }

  @override
  String toString() {
    return 'User(id: $id, name: $name, email: $email, role: $role, image: $image, completedLevels: $completedLevels, achievements: $achievements, score: $score, friends: $friends, friendsRequest: $friendsRequest)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.image, image) || other.image == image) &&
            const DeepCollectionEquality()
                .equals(other._completedLevels, _completedLevels) &&
            const DeepCollectionEquality()
                .equals(other._achievements, _achievements) &&
            (identical(other.score, score) || other.score == score) &&
            const DeepCollectionEquality().equals(other._friends, _friends) &&
            const DeepCollectionEquality()
                .equals(other._friendsRequest, _friendsRequest));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      email,
      role,
      image,
      const DeepCollectionEquality().hash(_completedLevels),
      const DeepCollectionEquality().hash(_achievements),
      score,
      const DeepCollectionEquality().hash(_friends),
      const DeepCollectionEquality().hash(_friendsRequest));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(
      this,
    );
  }
}

abstract class _User implements User {
  const factory _User(
      {required final String id,
      required final String name,
      required final String email,
      required final String role,
      final String? image,
      final List<dynamic> completedLevels,
      final List<dynamic> achievements,
      final int score,
      final List<String> friends,
      final List<String> friendsRequest}) = _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get email;
  @override
  String get role;
  @override
  String? get image;
  @override
  List<dynamic> get completedLevels;
  @override
  List<dynamic> get achievements;
  @override
  int get score;
  @override
  List<String> get friends;
  @override
  List<String> get friendsRequest;
  @override
  @JsonKey(ignore: true)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
