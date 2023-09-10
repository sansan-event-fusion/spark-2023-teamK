// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'firebase_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FirebaseUser _$FirebaseUserFromJson(Map<String, dynamic> json) {
  return _FirebaseUser.fromJson(json);
}

/// @nodoc
mixin _$FirebaseUser {
  String get id => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get userProfile => throw _privateConstructorUsedError;
  String get userInvitationID => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FirebaseUserCopyWith<FirebaseUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FirebaseUserCopyWith<$Res> {
  factory $FirebaseUserCopyWith(
          FirebaseUser value, $Res Function(FirebaseUser) then) =
      _$FirebaseUserCopyWithImpl<$Res, FirebaseUser>;
  @useResult
  $Res call(
      {String id,
      DateTime createdAt,
      String email,
      String userProfile,
      String userInvitationID});
}

/// @nodoc
class _$FirebaseUserCopyWithImpl<$Res, $Val extends FirebaseUser>
    implements $FirebaseUserCopyWith<$Res> {
  _$FirebaseUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? email = null,
    Object? userProfile = null,
    Object? userInvitationID = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      userProfile: null == userProfile
          ? _value.userProfile
          : userProfile // ignore: cast_nullable_to_non_nullable
              as String,
      userInvitationID: null == userInvitationID
          ? _value.userInvitationID
          : userInvitationID // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FirebaseUserCopyWith<$Res>
    implements $FirebaseUserCopyWith<$Res> {
  factory _$$_FirebaseUserCopyWith(
          _$_FirebaseUser value, $Res Function(_$_FirebaseUser) then) =
      __$$_FirebaseUserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      DateTime createdAt,
      String email,
      String userProfile,
      String userInvitationID});
}

/// @nodoc
class __$$_FirebaseUserCopyWithImpl<$Res>
    extends _$FirebaseUserCopyWithImpl<$Res, _$_FirebaseUser>
    implements _$$_FirebaseUserCopyWith<$Res> {
  __$$_FirebaseUserCopyWithImpl(
      _$_FirebaseUser _value, $Res Function(_$_FirebaseUser) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? email = null,
    Object? userProfile = null,
    Object? userInvitationID = null,
  }) {
    return _then(_$_FirebaseUser(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      userProfile: null == userProfile
          ? _value.userProfile
          : userProfile // ignore: cast_nullable_to_non_nullable
              as String,
      userInvitationID: null == userInvitationID
          ? _value.userInvitationID
          : userInvitationID // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FirebaseUser implements _FirebaseUser {
  _$_FirebaseUser(
      {required this.id,
      required this.createdAt,
      required this.email,
      required this.userProfile,
      required this.userInvitationID});

  factory _$_FirebaseUser.fromJson(Map<String, dynamic> json) =>
      _$$_FirebaseUserFromJson(json);

  @override
  final String id;
  @override
  final DateTime createdAt;
  @override
  final String email;
  @override
  final String userProfile;
  @override
  final String userInvitationID;

  @override
  String toString() {
    return 'FirebaseUser(id: $id, createdAt: $createdAt, email: $email, userProfile: $userProfile, userInvitationID: $userInvitationID)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FirebaseUser &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.userProfile, userProfile) ||
                other.userProfile == userProfile) &&
            (identical(other.userInvitationID, userInvitationID) ||
                other.userInvitationID == userInvitationID));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, createdAt, email, userProfile, userInvitationID);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FirebaseUserCopyWith<_$_FirebaseUser> get copyWith =>
      __$$_FirebaseUserCopyWithImpl<_$_FirebaseUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FirebaseUserToJson(
      this,
    );
  }
}

abstract class _FirebaseUser implements FirebaseUser {
  factory _FirebaseUser(
      {required final String id,
      required final DateTime createdAt,
      required final String email,
      required final String userProfile,
      required final String userInvitationID}) = _$_FirebaseUser;

  factory _FirebaseUser.fromJson(Map<String, dynamic> json) =
      _$_FirebaseUser.fromJson;

  @override
  String get id;
  @override
  DateTime get createdAt;
  @override
  String get email;
  @override
  String get userProfile;
  @override
  String get userInvitationID;
  @override
  @JsonKey(ignore: true)
  _$$_FirebaseUserCopyWith<_$_FirebaseUser> get copyWith =>
      throw _privateConstructorUsedError;
}
