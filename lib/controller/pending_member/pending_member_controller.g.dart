// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pending_member_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$memberControllerHash() => r'834ca44e1c2f0b1b5206929623407b2842b77e75';

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

abstract class _$MemberController
    extends BuildlessAutoDisposeAsyncNotifier<List<PendingMember>> {
  late final String groupId;

  Future<List<PendingMember>> build({
    required String groupId,
  });
}

/// See also [MemberController].
@ProviderFor(MemberController)
const memberControllerProvider = MemberControllerFamily();

/// See also [MemberController].
class MemberControllerFamily extends Family<AsyncValue<List<PendingMember>>> {
  /// See also [MemberController].
  const MemberControllerFamily();

  /// See also [MemberController].
  MemberControllerProvider call({
    required String groupId,
  }) {
    return MemberControllerProvider(
      groupId: groupId,
    );
  }

  @override
  MemberControllerProvider getProviderOverride(
    covariant MemberControllerProvider provider,
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
  String? get name => r'memberControllerProvider';
}

/// See also [MemberController].
class MemberControllerProvider extends AutoDisposeAsyncNotifierProviderImpl<
    MemberController, List<PendingMember>> {
  /// See also [MemberController].
  MemberControllerProvider({
    required String groupId,
  }) : this._internal(
          () => MemberController()..groupId = groupId,
          from: memberControllerProvider,
          name: r'memberControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$memberControllerHash,
          dependencies: MemberControllerFamily._dependencies,
          allTransitiveDependencies:
              MemberControllerFamily._allTransitiveDependencies,
          groupId: groupId,
        );

  MemberControllerProvider._internal(
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
    covariant MemberController notifier,
  ) {
    return notifier.build(
      groupId: groupId,
    );
  }

  @override
  Override overrideWith(MemberController Function() create) {
    return ProviderOverride(
      origin: this,
      override: MemberControllerProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<MemberController, List<PendingMember>>
      createElement() {
    return _MemberControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MemberControllerProvider && other.groupId == groupId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, groupId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin MemberControllerRef
    on AutoDisposeAsyncNotifierProviderRef<List<PendingMember>> {
  /// The parameter `groupId` of this provider.
  String get groupId;
}

class _MemberControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<MemberController,
        List<PendingMember>> with MemberControllerRef {
  _MemberControllerProviderElement(super.provider);

  @override
  String get groupId => (origin as MemberControllerProvider).groupId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
