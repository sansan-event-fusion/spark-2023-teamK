// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_picture_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$albumPictureControllerHash() =>
    r'70291d1e1fd78d1adfd8adce712c4469a1724616';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$AlbumPictureController
    extends BuildlessAutoDisposeAsyncNotifier<List<AlbumPicture>> {
  late final String groupId;
  late final String albumId;

  Future<List<AlbumPicture>> build({
    required String groupId,
    required String albumId,
  });
}

/// See also [AlbumPictureController].
@ProviderFor(AlbumPictureController)
const albumPictureControllerProvider = AlbumPictureControllerFamily();

/// See also [AlbumPictureController].
class AlbumPictureControllerFamily
    extends Family<AsyncValue<List<AlbumPicture>>> {
  /// See also [AlbumPictureController].
  const AlbumPictureControllerFamily();

  /// See also [AlbumPictureController].
  AlbumPictureControllerProvider call({
    required String groupId,
    required String albumId,
  }) {
    return AlbumPictureControllerProvider(
      groupId: groupId,
      albumId: albumId,
    );
  }

  @override
  AlbumPictureControllerProvider getProviderOverride(
    covariant AlbumPictureControllerProvider provider,
  ) {
    return call(
      groupId: provider.groupId,
      albumId: provider.albumId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'albumPictureControllerProvider';
}

/// See also [AlbumPictureController].
class AlbumPictureControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<AlbumPictureController,
        List<AlbumPicture>> {
  /// See also [AlbumPictureController].
  AlbumPictureControllerProvider({
    required String groupId,
    required String albumId,
  }) : this._internal(
          () => AlbumPictureController()
            ..groupId = groupId
            ..albumId = albumId,
          from: albumPictureControllerProvider,
          name: r'albumPictureControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$albumPictureControllerHash,
          dependencies: AlbumPictureControllerFamily._dependencies,
          allTransitiveDependencies:
              AlbumPictureControllerFamily._allTransitiveDependencies,
          groupId: groupId,
          albumId: albumId,
        );

  AlbumPictureControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.groupId,
    required this.albumId,
  }) : super.internal();

  final String groupId;
  final String albumId;

  @override
  Future<List<AlbumPicture>> runNotifierBuild(
    covariant AlbumPictureController notifier,
  ) {
    return notifier.build(
      groupId: groupId,
      albumId: albumId,
    );
  }

  @override
  Override overrideWith(AlbumPictureController Function() create) {
    return ProviderOverride(
      origin: this,
      override: AlbumPictureControllerProvider._internal(
        () => create()
          ..groupId = groupId
          ..albumId = albumId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        groupId: groupId,
        albumId: albumId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<AlbumPictureController,
      List<AlbumPicture>> createElement() {
    return _AlbumPictureControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AlbumPictureControllerProvider &&
        other.groupId == groupId &&
        other.albumId == albumId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, groupId.hashCode);
    hash = _SystemHash.combine(hash, albumId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AlbumPictureControllerRef
    on AutoDisposeAsyncNotifierProviderRef<List<AlbumPicture>> {
  /// The parameter `groupId` of this provider.
  String get groupId;

  /// The parameter `albumId` of this provider.
  String get albumId;
}

class _AlbumPictureControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<AlbumPictureController,
        List<AlbumPicture>> with AlbumPictureControllerRef {
  _AlbumPictureControllerProviderElement(super.provider);

  @override
  String get groupId => (origin as AlbumPictureControllerProvider).groupId;
  @override
  String get albumId => (origin as AlbumPictureControllerProvider).albumId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
