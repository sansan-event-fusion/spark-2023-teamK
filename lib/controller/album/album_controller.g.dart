// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$albumControllerHash() => r'98ce36c6c26b87a3d31130a6fdfea1ad4b7c89f1';

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

abstract class _$AlbumController
    extends BuildlessAutoDisposeAsyncNotifier<List<Album>> {
  late final String groupId;

  Future<List<Album>> build({
    required String groupId,
  });
}

/// See also [AlbumController].
@ProviderFor(AlbumController)
const albumControllerProvider = AlbumControllerFamily();

/// See also [AlbumController].
class AlbumControllerFamily extends Family<AsyncValue<List<Album>>> {
  /// See also [AlbumController].
  const AlbumControllerFamily();

  /// See also [AlbumController].
  AlbumControllerProvider call({
    required String groupId,
  }) {
    return AlbumControllerProvider(
      groupId: groupId,
    );
  }

  @override
  AlbumControllerProvider getProviderOverride(
    covariant AlbumControllerProvider provider,
  ) {
    return call(
      groupId: provider.groupId,
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
  String? get name => r'albumControllerProvider';
}

/// See also [AlbumController].
class AlbumControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<AlbumController, List<Album>> {
  /// See also [AlbumController].
  AlbumControllerProvider({
    required String groupId,
  }) : this._internal(
          () => AlbumController()..groupId = groupId,
          from: albumControllerProvider,
          name: r'albumControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$albumControllerHash,
          dependencies: AlbumControllerFamily._dependencies,
          allTransitiveDependencies:
              AlbumControllerFamily._allTransitiveDependencies,
          groupId: groupId,
        );

  AlbumControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.groupId,
  }) : super.internal();

  final String groupId;

  @override
  Future<List<Album>> runNotifierBuild(
    covariant AlbumController notifier,
  ) {
    return notifier.build(
      groupId: groupId,
    );
  }

  @override
  Override overrideWith(AlbumController Function() create) {
    return ProviderOverride(
      origin: this,
      override: AlbumControllerProvider._internal(
        () => create()..groupId = groupId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        groupId: groupId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<AlbumController, List<Album>>
      createElement() {
    return _AlbumControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AlbumControllerProvider && other.groupId == groupId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, groupId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AlbumControllerRef on AutoDisposeAsyncNotifierProviderRef<List<Album>> {
  /// The parameter `groupId` of this provider.
  String get groupId;
}

class _AlbumControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<AlbumController,
        List<Album>> with AlbumControllerRef {
  _AlbumControllerProviderElement(super.provider);

  @override
  String get groupId => (origin as AlbumControllerProvider).groupId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
