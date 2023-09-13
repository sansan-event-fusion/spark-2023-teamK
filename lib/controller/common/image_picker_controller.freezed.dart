// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_picker_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ImagePickerState {
  File? get imageFile => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ImagePickerStateCopyWith<ImagePickerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImagePickerStateCopyWith<$Res> {
  factory $ImagePickerStateCopyWith(
          ImagePickerState value, $Res Function(ImagePickerState) then) =
      _$ImagePickerStateCopyWithImpl<$Res, ImagePickerState>;
  @useResult
  $Res call({File? imageFile});
}

/// @nodoc
class _$ImagePickerStateCopyWithImpl<$Res, $Val extends ImagePickerState>
    implements $ImagePickerStateCopyWith<$Res> {
  _$ImagePickerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageFile = freezed,
  }) {
    return _then(_value.copyWith(
      imageFile: freezed == imageFile
          ? _value.imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as File?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ImagePickerStateCopyWith<$Res>
    implements $ImagePickerStateCopyWith<$Res> {
  factory _$$_ImagePickerStateCopyWith(
          _$_ImagePickerState value, $Res Function(_$_ImagePickerState) then) =
      __$$_ImagePickerStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({File? imageFile});
}

/// @nodoc
class __$$_ImagePickerStateCopyWithImpl<$Res>
    extends _$ImagePickerStateCopyWithImpl<$Res, _$_ImagePickerState>
    implements _$$_ImagePickerStateCopyWith<$Res> {
  __$$_ImagePickerStateCopyWithImpl(
      _$_ImagePickerState _value, $Res Function(_$_ImagePickerState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageFile = freezed,
  }) {
    return _then(_$_ImagePickerState(
      imageFile: freezed == imageFile
          ? _value.imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as File?,
    ));
  }
}

/// @nodoc

class _$_ImagePickerState implements _ImagePickerState {
  const _$_ImagePickerState({this.imageFile});

  @override
  final File? imageFile;

  @override
  String toString() {
    return 'ImagePickerState(imageFile: $imageFile)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ImagePickerState &&
            (identical(other.imageFile, imageFile) ||
                other.imageFile == imageFile));
  }

  @override
  int get hashCode => Object.hash(runtimeType, imageFile);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ImagePickerStateCopyWith<_$_ImagePickerState> get copyWith =>
      __$$_ImagePickerStateCopyWithImpl<_$_ImagePickerState>(this, _$identity);
}

abstract class _ImagePickerState implements ImagePickerState {
  const factory _ImagePickerState({final File? imageFile}) =
      _$_ImagePickerState;

  @override
  File? get imageFile;
  @override
  @JsonKey(ignore: true)
  _$$_ImagePickerStateCopyWith<_$_ImagePickerState> get copyWith =>
      throw _privateConstructorUsedError;
}
