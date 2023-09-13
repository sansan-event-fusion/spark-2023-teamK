// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pending_member_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$pendingMemberControllerHash() =>
    r'bf53a5ec423add38798d3429dba00caf2a157a2d';

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

abstract class _$PendingMemberController
    extends BuildlessAutoDisposeAsyncNotifier<List<PendingMember>> {
  late final String groupId;

  Future<List<PendingMember>> build({
    required String groupId,
  });
}

/// See also [PendingMemberController].
@ProviderFor(PendingMemberController)
const pendingMemberControllerProvider = PendingMemberControllerFamily();

/// See also [PendingMemberController].
class PendingMemberControllerFamily
    extends Family<AsyncValue<List<PendingMember>>> {
  /// See also [PendingMemberController].
  const PendingMemberControllerFamily();

  /// See also [PendingMemberController].
  PendingMemberControllerProvider call({
    required String groupId,
  }) {
    return PendingMemberControllerProvider(
      groupId: groupId,
    );
  }

  @override
  PendingMemberControllerProvider getProviderOverride(
    covariant PendingMemberControllerProvider provider,
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
  String? get name => r'pendingMemberControllerProvider';
}

/// See also [PendingMemberController].
class PendingMemberControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<PendingMemberController,
        List<PendingMember>> {
  /// See also [PendingMemberController].
  PendingMemberControllerProvider({
    required String groupId,
  }) : this._internal(
          () => PendingMemberController()..groupId = groupId,
          from: pendingMemberControllerProvider,
          name: r'pendingMemberControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$pendingMemberControllerHash,
          dependencies: PendingMemberControllerFamily._dependencies,
          allTransitiveDependencies:
              PendingMemberControllerFamily._allTransitiveDependencies,
          groupId: groupId,
        );

  PendingMemberControllerProvider._internal(
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
  Future<List<PendingMember>> runNotifierBuild(
    covariant PendingMemberController notifier,
  ) {
    return notifier.build(
      groupId: groupId,
    );
  }

  @override
  Override overrideWith(PendingMemberController Function() create) {
    return ProviderOverride(
      origin: this,
      override: PendingMemberControllerProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<PendingMemberController,
      List<PendingMember>> createElement() {
    return _PendingMemberControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PendingMemberControllerProvider && other.groupId == groupId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, groupId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PendingMemberControllerRef
    on AutoDisposeAsyncNotifierProviderRef<List<PendingMember>> {
  /// The parameter `groupId` of this provider.
  String get groupId;
}

class _PendingMemberControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<PendingMemberController,
        List<PendingMember>> with PendingMemberControllerRef {
  _PendingMemberControllerProviderElement(super.provider);

  @override
  String get groupId => (origin as PendingMemberControllerProvider).groupId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
