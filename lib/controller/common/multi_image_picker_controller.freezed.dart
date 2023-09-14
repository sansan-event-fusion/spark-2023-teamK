// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'multi_image_picker_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MultiImagePickerState {
  List<File>? get imageFileList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MultiImagePickerStateCopyWith<MultiImagePickerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MultiImagePickerStateCopyWith<$Res> {
  factory $MultiImagePickerStateCopyWith(MultiImagePickerState value,
          $Res Function(MultiImagePickerState) then) =
      _$MultiImagePickerStateCopyWithImpl<$Res, MultiImagePickerState>;
  @useResult
  $Res call({List<File>? imageFileList});
}

/// @nodoc
class _$MultiImagePickerStateCopyWithImpl<$Res,
        $Val extends MultiImagePickerState>
    implements $MultiImagePickerStateCopyWith<$Res> {
  _$MultiImagePickerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageFileList = freezed,
  }) {
    return _then(_value.copyWith(
      imageFileList: freezed == imageFileList
          ? _value.imageFileList
          : imageFileList // ignore: cast_nullable_to_non_nullable
              as List<File>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MultiImagePickerStateCopyWith<$Res>
    implements $MultiImagePickerStateCopyWith<$Res> {
  factory _$$_MultiImagePickerStateCopyWith(_$_MultiImagePickerState value,
          $Res Function(_$_MultiImagePickerState) then) =
      __$$_MultiImagePickerStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<File>? imageFileList});
}

/// @nodoc
class __$$_MultiImagePickerStateCopyWithImpl<$Res>
    extends _$MultiImagePickerStateCopyWithImpl<$Res, _$_MultiImagePickerState>
    implements _$$_MultiImagePickerStateCopyWith<$Res> {
  __$$_MultiImagePickerStateCopyWithImpl(_$_MultiImagePickerState _value,
      $Res Function(_$_MultiImagePickerState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageFileList = freezed,
  }) {
    return _then(_$_MultiImagePickerState(
      imageFileList: freezed == imageFileList
          ? _value._imageFileList
          : imageFileList // ignore: cast_nullable_to_non_nullable
              as List<File>?,
    ));
  }
}

/// @nodoc

class _$_MultiImagePickerState implements _MultiImagePickerState {
  const _$_MultiImagePickerState({final List<File>? imageFileList})
      : _imageFileList = imageFileList;

  final List<File>? _imageFileList;
  @override
  List<File>? get imageFileList {
    final value = _imageFileList;
    if (value == null) return null;
    if (_imageFileList is EqualUnmodifiableListView) return _imageFileList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'MultiImagePickerState(imageFileList: $imageFileList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MultiImagePickerState &&
            const DeepCollectionEquality()
                .equals(other._imageFileList, _imageFileList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_imageFileList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MultiImagePickerStateCopyWith<_$_MultiImagePickerState> get copyWith =>
      __$$_MultiImagePickerStateCopyWithImpl<_$_MultiImagePickerState>(
          this, _$identity);
}

abstract class _MultiImagePickerState implements MultiImagePickerState {
  const factory _MultiImagePickerState({final List<File>? imageFileList}) =
      _$_MultiImagePickerState;

  @override
  List<File>? get imageFileList;
  @override
  @JsonKey(ignore: true)
  _$$_MultiImagePickerStateCopyWith<_$_MultiImagePickerState> get copyWith =>
      throw _privateConstructorUsedError;
}
