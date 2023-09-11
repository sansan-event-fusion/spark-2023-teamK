// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invited_member.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

InvitedMember _$InvitedMemberFromJson(Map<String, dynamic> json) {
  return _InvitedMember.fromJson(json);
}

/// @nodoc
mixin _$InvitedMember {
  String get invitedMemberId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get icon => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InvitedMemberCopyWith<InvitedMember> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvitedMemberCopyWith<$Res> {
  factory $InvitedMemberCopyWith(
          InvitedMember value, $Res Function(InvitedMember) then) =
      _$InvitedMemberCopyWithImpl<$Res, InvitedMember>;
  @useResult
  $Res call(
      {String invitedMemberId, String name, String icon, DateTime createdAt});
}

/// @nodoc
class _$InvitedMemberCopyWithImpl<$Res, $Val extends InvitedMember>
    implements $InvitedMemberCopyWith<$Res> {
  _$InvitedMemberCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invitedMemberId = null,
    Object? name = null,
    Object? icon = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      invitedMemberId: null == invitedMemberId
          ? _value.invitedMemberId
          : invitedMemberId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InvitedMemberCopyWith<$Res>
    implements $InvitedMemberCopyWith<$Res> {
  factory _$$_InvitedMemberCopyWith(
          _$_InvitedMember value, $Res Function(_$_InvitedMember) then) =
      __$$_InvitedMemberCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String invitedMemberId, String name, String icon, DateTime createdAt});
}

/// @nodoc
class __$$_InvitedMemberCopyWithImpl<$Res>
    extends _$InvitedMemberCopyWithImpl<$Res, _$_InvitedMember>
    implements _$$_InvitedMemberCopyWith<$Res> {
  __$$_InvitedMemberCopyWithImpl(
      _$_InvitedMember _value, $Res Function(_$_InvitedMember) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invitedMemberId = null,
    Object? name = null,
    Object? icon = null,
    Object? createdAt = null,
  }) {
    return _then(_$_InvitedMember(
      invitedMemberId: null == invitedMemberId
          ? _value.invitedMemberId
          : invitedMemberId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_InvitedMember implements _InvitedMember {
  _$_InvitedMember(
      {required this.invitedMemberId,
      required this.name,
      required this.icon,
      required this.createdAt});

  factory _$_InvitedMember.fromJson(Map<String, dynamic> json) =>
      _$$_InvitedMemberFromJson(json);

  @override
  final String invitedMemberId;
  @override
  final String name;
  @override
  final String icon;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'InvitedMember(invitedMemberId: $invitedMemberId, name: $name, icon: $icon, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InvitedMember &&
            (identical(other.invitedMemberId, invitedMemberId) ||
                other.invitedMemberId == invitedMemberId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, invitedMemberId, name, icon, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InvitedMemberCopyWith<_$_InvitedMember> get copyWith =>
      __$$_InvitedMemberCopyWithImpl<_$_InvitedMember>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_InvitedMemberToJson(
      this,
    );
  }
}

abstract class _InvitedMember implements InvitedMember {
  factory _InvitedMember(
      {required final String invitedMemberId,
      required final String name,
      required final String icon,
      required final DateTime createdAt}) = _$_InvitedMember;

  factory _InvitedMember.fromJson(Map<String, dynamic> json) =
      _$_InvitedMember.fromJson;

  @override
  String get invitedMemberId;
  @override
  String get name;
  @override
  String get icon;
  @override
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_InvitedMemberCopyWith<_$_InvitedMember> get copyWith =>
      throw _privateConstructorUsedError;
}
