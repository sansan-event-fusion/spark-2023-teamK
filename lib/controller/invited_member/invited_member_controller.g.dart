// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invited_member_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$invitedMemberControllerHash() =>
    r'2411500a33f97a4dc98101eefe3523f3fd9744a7';

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

abstract class _$InvitedMemberController
    extends BuildlessAutoDisposeAsyncNotifier<List<InvitedMember>> {
  late final String groupId;

  Future<List<InvitedMember>> build({
    required String groupId,
  });
}

/// See also [InvitedMemberController].
@ProviderFor(InvitedMemberController)
const invitedMemberControllerProvider = InvitedMemberControllerFamily();

/// See also [InvitedMemberController].
class InvitedMemberControllerFamily
    extends Family<AsyncValue<List<InvitedMember>>> {
  /// See also [InvitedMemberController].
  const InvitedMemberControllerFamily();

  /// See also [InvitedMemberController].
  InvitedMemberControllerProvider call({
    required String groupId,
  }) {
    return InvitedMemberControllerProvider(
      groupId: groupId,
    );
  }

  @override
  InvitedMemberControllerProvider getProviderOverride(
    covariant InvitedMemberControllerProvider provider,
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
  String? get name => r'invitedMemberControllerProvider';
}

/// See also [InvitedMemberController].
class InvitedMemberControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<InvitedMemberController,
        List<InvitedMember>> {
  /// See also [InvitedMemberController].
  InvitedMemberControllerProvider({
    required String groupId,
  }) : this._internal(
          () => InvitedMemberController()..groupId = groupId,
          from: invitedMemberControllerProvider,
          name: r'invitedMemberControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$invitedMemberControllerHash,
          dependencies: InvitedMemberControllerFamily._dependencies,
          allTransitiveDependencies:
              InvitedMemberControllerFamily._allTransitiveDependencies,
          groupId: groupId,
        );

  InvitedMemberControllerProvider._internal(
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
  Future<List<InvitedMember>> runNotifierBuild(
    covariant InvitedMemberController notifier,
  ) {
    return notifier.build(
      groupId: groupId,
    );
  }

  @override
  Override overrideWith(InvitedMemberController Function() create) {
    return ProviderOverride(
      origin: this,
      override: InvitedMemberControllerProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<InvitedMemberController,
      List<InvitedMember>> createElement() {
    return _InvitedMemberControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is InvitedMemberControllerProvider && other.groupId == groupId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, groupId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin InvitedMemberControllerRef
    on AutoDisposeAsyncNotifierProviderRef<List<InvitedMember>> {
  /// The parameter `groupId` of this provider.
  String get groupId;
}

class _InvitedMemberControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<InvitedMemberController,
        List<InvitedMember>> with InvitedMemberControllerRef {
  _InvitedMemberControllerProviderElement(super.provider);

  @override
  String get groupId => (origin as InvitedMemberControllerProvider).groupId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
