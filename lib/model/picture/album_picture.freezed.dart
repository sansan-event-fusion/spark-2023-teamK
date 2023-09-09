// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'album_picture.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AlbumPicture _$AlbumPictureFromJson(Map<String, dynamic> json) {
  return _AlbumPicture.fromJson(json);
}

/// @nodoc
mixin _$AlbumPicture {
  String get albumPictureId => throw _privateConstructorUsedError;
  String get pictureUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AlbumPictureCopyWith<AlbumPicture> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlbumPictureCopyWith<$Res> {
  factory $AlbumPictureCopyWith(
          AlbumPicture value, $Res Function(AlbumPicture) then) =
      _$AlbumPictureCopyWithImpl<$Res, AlbumPicture>;
  @useResult
  $Res call({String albumPictureId, String pictureUrl});
}

/// @nodoc
class _$AlbumPictureCopyWithImpl<$Res, $Val extends AlbumPicture>
    implements $AlbumPictureCopyWith<$Res> {
  _$AlbumPictureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? albumPictureId = null,
    Object? pictureUrl = null,
  }) {
    return _then(_value.copyWith(
      albumPictureId: null == albumPictureId
          ? _value.albumPictureId
          : albumPictureId // ignore: cast_nullable_to_non_nullable
              as String,
      pictureUrl: null == pictureUrl
          ? _value.pictureUrl
          : pictureUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AlbumPictureCopyWith<$Res>
    implements $AlbumPictureCopyWith<$Res> {
  factory _$$_AlbumPictureCopyWith(
          _$_AlbumPicture value, $Res Function(_$_AlbumPicture) then) =
      __$$_AlbumPictureCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String albumPictureId, String pictureUrl});
}

/// @nodoc
class __$$_AlbumPictureCopyWithImpl<$Res>
    extends _$AlbumPictureCopyWithImpl<$Res, _$_AlbumPicture>
    implements _$$_AlbumPictureCopyWith<$Res> {
  __$$_AlbumPictureCopyWithImpl(
      _$_AlbumPicture _value, $Res Function(_$_AlbumPicture) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? albumPictureId = null,
    Object? pictureUrl = null,
  }) {
    return _then(_$_AlbumPicture(
      albumPictureId: null == albumPictureId
          ? _value.albumPictureId
          : albumPictureId // ignore: cast_nullable_to_non_nullable
              as String,
      pictureUrl: null == pictureUrl
          ? _value.pictureUrl
          : pictureUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AlbumPicture implements _AlbumPicture {
  _$_AlbumPicture({required this.albumPictureId, required this.pictureUrl});

  factory _$_AlbumPicture.fromJson(Map<String, dynamic> json) =>
      _$$_AlbumPictureFromJson(json);

  @override
  final String albumPictureId;
  @override
  final String pictureUrl;

  @override
  String toString() {
    return 'AlbumPicture(albumPictureId: $albumPictureId, pictureUrl: $pictureUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AlbumPicture &&
            (identical(other.albumPictureId, albumPictureId) ||
                other.albumPictureId == albumPictureId) &&
            (identical(other.pictureUrl, pictureUrl) ||
                other.pictureUrl == pictureUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, albumPictureId, pictureUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AlbumPictureCopyWith<_$_AlbumPicture> get copyWith =>
      __$$_AlbumPictureCopyWithImpl<_$_AlbumPicture>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AlbumPictureToJson(
      this,
    );
  }
}

abstract class _AlbumPicture implements AlbumPicture {
  factory _AlbumPicture(
      {required final String albumPictureId,
      required final String pictureUrl}) = _$_AlbumPicture;

  factory _AlbumPicture.fromJson(Map<String, dynamic> json) =
      _$_AlbumPicture.fromJson;

  @override
  String get albumPictureId;
  @override
  String get pictureUrl;
  @override
  @JsonKey(ignore: true)
  _$$_AlbumPictureCopyWith<_$_AlbumPicture> get copyWith =>
      throw _privateConstructorUsedError;
}
