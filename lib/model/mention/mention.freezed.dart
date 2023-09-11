// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mention.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Mention _$MentionFromJson(Map<String, dynamic> json) {
  return _Mention.fromJson(json);
}

/// @nodoc
mixin _$Mention {
  String get mentionId => throw _privateConstructorUsedError;
  String get memberId => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MentionCopyWith<Mention> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MentionCopyWith<$Res> {
  factory $MentionCopyWith(Mention value, $Res Function(Mention) then) =
      _$MentionCopyWithImpl<$Res, Mention>;
  @useResult
  $Res call({String mentionId, String memberId, DateTime createdAt});
}

/// @nodoc
class _$MentionCopyWithImpl<$Res, $Val extends Mention>
    implements $MentionCopyWith<$Res> {
  _$MentionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mentionId = null,
    Object? memberId = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      mentionId: null == mentionId
          ? _value.mentionId
          : mentionId // ignore: cast_nullable_to_non_nullable
              as String,
      memberId: null == memberId
          ? _value.memberId
          : memberId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MentionCopyWith<$Res> implements $MentionCopyWith<$Res> {
  factory _$$_MentionCopyWith(
          _$_Mention value, $Res Function(_$_Mention) then) =
      __$$_MentionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String mentionId, String memberId, DateTime createdAt});
}

/// @nodoc
class __$$_MentionCopyWithImpl<$Res>
    extends _$MentionCopyWithImpl<$Res, _$_Mention>
    implements _$$_MentionCopyWith<$Res> {
  __$$_MentionCopyWithImpl(_$_Mention _value, $Res Function(_$_Mention) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mentionId = null,
    Object? memberId = null,
    Object? createdAt = null,
  }) {
    return _then(_$_Mention(
      mentionId: null == mentionId
          ? _value.mentionId
          : mentionId // ignore: cast_nullable_to_non_nullable
              as String,
      memberId: null == memberId
          ? _value.memberId
          : memberId // ignore: cast_nullable_to_non_nullable
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
class _$_Mention implements _Mention {
  _$_Mention(
      {required this.mentionId,
      required this.memberId,
      required this.createdAt});

  factory _$_Mention.fromJson(Map<String, dynamic> json) =>
      _$$_MentionFromJson(json);

  @override
  final String mentionId;
  @override
  final String memberId;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'Mention(mentionId: $mentionId, memberId: $memberId, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Mention &&
            (identical(other.mentionId, mentionId) ||
                other.mentionId == mentionId) &&
            (identical(other.memberId, memberId) ||
                other.memberId == memberId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, mentionId, memberId, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MentionCopyWith<_$_Mention> get copyWith =>
      __$$_MentionCopyWithImpl<_$_Mention>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MentionToJson(
      this,
    );
  }
}

abstract class _Mention implements Mention {
  factory _Mention(
      {required final String mentionId,
      required final String memberId,
      required final DateTime createdAt}) = _$_Mention;

  factory _Mention.fromJson(Map<String, dynamic> json) = _$_Mention.fromJson;

  @override
  String get mentionId;
  @override
  String get memberId;
  @override
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_MentionCopyWith<_$_Mention> get copyWith =>
      throw _privateConstructorUsedError;
}
