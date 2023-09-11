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
  String get userId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get icon => throw _privateConstructorUsedError;
  String get accountId => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;

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
      {String userId,
      String name,
      String icon,
      String accountId,
      String email});
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
    Object? userId = null,
    Object? name = null,
    Object? icon = null,
    Object? accountId = null,
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      accountId: null == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
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
      {String userId,
      String name,
      String icon,
      String accountId,
      String email});
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
    Object? userId = null,
    Object? name = null,
    Object? icon = null,
    Object? accountId = null,
    Object? email = null,
  }) {
    return _then(_$_FirebaseUser(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      accountId: null == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FirebaseUser implements _FirebaseUser {
  _$_FirebaseUser(
      {required this.userId,
      required this.name,
      required this.icon,
      required this.accountId,
      required this.email});

  factory _$_FirebaseUser.fromJson(Map<String, dynamic> json) =>
      _$$_FirebaseUserFromJson(json);

  @override
  final String userId;
  @override
  final String name;
  @override
  final String icon;
  @override
  final String accountId;
  @override
  final String email;

  @override
  String toString() {
    return 'FirebaseUser(userId: $userId, name: $name, icon: $icon, accountId: $accountId, email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FirebaseUser &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.accountId, accountId) ||
                other.accountId == accountId) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, userId, name, icon, accountId, email);

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
      {required final String userId,
      required final String name,
      required final String icon,
      required final String accountId,
      required final String email}) = _$_FirebaseUser;

  factory _FirebaseUser.fromJson(Map<String, dynamic> json) =
      _$_FirebaseUser.fromJson;

  @override
  String get userId;
  @override
  String get name;
  @override
  String get icon;
  @override
  String get accountId;
  @override
  String get email;
  @override
  @JsonKey(ignore: true)
  _$$_FirebaseUserCopyWith<_$_FirebaseUser> get copyWith =>
      throw _privateConstructorUsedError;
}
