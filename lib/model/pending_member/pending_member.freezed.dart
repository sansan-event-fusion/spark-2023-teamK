// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pending_member.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PendingMember _$PendingMemberFromJson(Map<String, dynamic> json) {
  return _PendingMember.fromJson(json);
}

/// @nodoc
mixin _$PendingMember {
  String get pendingMemberId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get icon => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PendingMemberCopyWith<PendingMember> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PendingMemberCopyWith<$Res> {
  factory $PendingMemberCopyWith(
          PendingMember value, $Res Function(PendingMember) then) =
      _$PendingMemberCopyWithImpl<$Res, PendingMember>;
  @useResult
  $Res call(
      {String pendingMemberId, String name, String icon, DateTime createdAt});
}

/// @nodoc
class _$PendingMemberCopyWithImpl<$Res, $Val extends PendingMember>
    implements $PendingMemberCopyWith<$Res> {
  _$PendingMemberCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pendingMemberId = null,
    Object? name = null,
    Object? icon = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      pendingMemberId: null == pendingMemberId
          ? _value.pendingMemberId
          : pendingMemberId // ignore: cast_nullable_to_non_nullable
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
abstract class _$$_PendingMemberCopyWith<$Res>
    implements $PendingMemberCopyWith<$Res> {
  factory _$$_PendingMemberCopyWith(
          _$_PendingMember value, $Res Function(_$_PendingMember) then) =
      __$$_PendingMemberCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String pendingMemberId, String name, String icon, DateTime createdAt});
}

/// @nodoc
class __$$_PendingMemberCopyWithImpl<$Res>
    extends _$PendingMemberCopyWithImpl<$Res, _$_PendingMember>
    implements _$$_PendingMemberCopyWith<$Res> {
  __$$_PendingMemberCopyWithImpl(
      _$_PendingMember _value, $Res Function(_$_PendingMember) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pendingMemberId = null,
    Object? name = null,
    Object? icon = null,
    Object? createdAt = null,
  }) {
    return _then(_$_PendingMember(
      pendingMemberId: null == pendingMemberId
          ? _value.pendingMemberId
          : pendingMemberId // ignore: cast_nullable_to_non_nullable
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
class _$_PendingMember implements _PendingMember {
  _$_PendingMember(
      {required this.pendingMemberId,
      required this.name,
      required this.icon,
      required this.createdAt});

  factory _$_PendingMember.fromJson(Map<String, dynamic> json) =>
      _$$_PendingMemberFromJson(json);

  @override
  final String pendingMemberId;
  @override
  final String name;
  @override
  final String icon;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'PendingMember(pendingMemberId: $pendingMemberId, name: $name, icon: $icon, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PendingMember &&
            (identical(other.pendingMemberId, pendingMemberId) ||
                other.pendingMemberId == pendingMemberId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, pendingMemberId, name, icon, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PendingMemberCopyWith<_$_PendingMember> get copyWith =>
      __$$_PendingMemberCopyWithImpl<_$_PendingMember>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PendingMemberToJson(
      this,
    );
  }
}

abstract class _PendingMember implements PendingMember {
  factory _PendingMember(
      {required final String pendingMemberId,
      required final String name,
      required final String icon,
      required final DateTime createdAt}) = _$_PendingMember;

  factory _PendingMember.fromJson(Map<String, dynamic> json) =
      _$_PendingMember.fromJson;

  @override
  String get pendingMemberId;
  @override
  String get name;
  @override
  String get icon;
  @override
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_PendingMemberCopyWith<_$_PendingMember> get copyWith =>
      throw _privateConstructorUsedError;
}
