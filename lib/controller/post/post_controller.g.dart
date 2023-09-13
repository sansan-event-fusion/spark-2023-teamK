// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$postControllerHash() => r'325f1b1edb7a039c5d7fdd78fe038c1c6561b615';

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

abstract class _$PostController
    extends BuildlessAutoDisposeAsyncNotifier<List<Post>> {
  late final String groupId;

  Future<List<Post>> build({
    required String groupId,
  });
}

/// See also [PostController].
@ProviderFor(PostController)
const postControllerProvider = PostControllerFamily();

/// See also [PostController].
class PostControllerFamily extends Family<AsyncValue<List<Post>>> {
  /// See also [PostController].
  const PostControllerFamily();

  /// See also [PostController].
  PostControllerProvider call({
    required String groupId,
  }) {
    return PostControllerProvider(
      groupId: groupId,
    );
  }

  @override
  PostControllerProvider getProviderOverride(
    covariant PostControllerProvider provider,
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
  String? get name => r'postControllerProvider';
}

/// See also [PostController].
class PostControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<PostController, List<Post>> {
  /// See also [PostController].
  PostControllerProvider({
    required String groupId,
  }) : this._internal(
          () => PostController()..groupId = groupId,
          from: postControllerProvider,
          name: r'postControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$postControllerHash,
          dependencies: PostControllerFamily._dependencies,
          allTransitiveDependencies:
              PostControllerFamily._allTransitiveDependencies,
          groupId: groupId,
        );

  PostControllerProvider._internal(
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
  Future<List<Post>> runNotifierBuild(
    covariant PostController notifier,
  ) {
    return notifier.build(
      groupId: groupId,
    );
  }

  @override
  Override overrideWith(PostController Function() create) {
    return ProviderOverride(
      origin: this,
      override: PostControllerProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<PostController, List<Post>>
      createElement() {
    return _PostControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PostControllerProvider && other.groupId == groupId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, groupId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PostControllerRef on AutoDisposeAsyncNotifierProviderRef<List<Post>> {
  /// The parameter `groupId` of this provider.
  String get groupId;
}

class _PostControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<PostController, List<Post>>
    with PostControllerRef {
  _PostControllerProviderElement(super.provider);

  @override
  String get groupId => (origin as PostControllerProvider).groupId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
