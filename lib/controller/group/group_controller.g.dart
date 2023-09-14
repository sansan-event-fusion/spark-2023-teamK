// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$groupControllerHash() => r'4564ff405320eb837ebcc7937c3685ecf5ee3df0';

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

abstract class _$GroupController
    extends BuildlessAutoDisposeAsyncNotifier<Group?> {
  late final String userId;

  Future<Group?> build({
    required String userId,
  });
}

/// See also [GroupController].
@ProviderFor(GroupController)
const groupControllerProvider = GroupControllerFamily();

/// See also [GroupController].
class GroupControllerFamily extends Family<AsyncValue<Group?>> {
  /// See also [GroupController].
  const GroupControllerFamily();

  /// See also [GroupController].
  GroupControllerProvider call({
    required String userId,
  }) {
    return GroupControllerProvider(
      userId: userId,
    );
  }

  @override
  GroupControllerProvider getProviderOverride(
    covariant GroupControllerProvider provider,
  ) {
    return call(
      userId: provider.userId,
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
  String? get name => r'groupControllerProvider';
}

/// See also [GroupController].
class GroupControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<GroupController, Group?> {
  /// See also [GroupController].
  GroupControllerProvider({
    required String userId,
  }) : this._internal(
          () => GroupController()..userId = userId,
          from: groupControllerProvider,
          name: r'groupControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$groupControllerHash,
          dependencies: GroupControllerFamily._dependencies,
          allTransitiveDependencies:
              GroupControllerFamily._allTransitiveDependencies,
          userId: userId,
        );

  GroupControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
  }) : super.internal();

  final String userId;

  @override
  Future<Group?> runNotifierBuild(
    covariant GroupController notifier,
  ) {
    return notifier.build(
      userId: userId,
    );
  }

  @override
  Override overrideWith(GroupController Function() create) {
    return ProviderOverride(
      origin: this,
      override: GroupControllerProvider._internal(
        () => create()..userId = userId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userId: userId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<GroupController, Group?>
      createElement() {
    return _GroupControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GroupControllerProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GroupControllerRef on AutoDisposeAsyncNotifierProviderRef<Group?> {
  /// The parameter `userId` of this provider.
  String get userId;
}

class _GroupControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<GroupController, Group?>
    with GroupControllerRef {
  _GroupControllerProviderElement(super.provider);

  @override
  String get userId => (origin as GroupControllerProvider).userId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
