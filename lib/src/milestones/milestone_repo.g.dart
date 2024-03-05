// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'milestone_repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$milestoneRepositoryHash() =>
    r'43257f6a147ca33bc1199c5b20f223692bb306bd';

/// See also [milestoneRepository].
@ProviderFor(milestoneRepository)
final milestoneRepositoryProvider =
    AutoDisposeProvider<MilestoneRepository>.internal(
  milestoneRepository,
  name: r'milestoneRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$milestoneRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef MilestoneRepositoryRef = AutoDisposeProviderRef<MilestoneRepository>;
String _$fetchMilestoneHash() => r'ef0a2bef3571c648d10a73702888c27fae5e9633';

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

/// See also [fetchMilestone].
@ProviderFor(fetchMilestone)
const fetchMilestoneProvider = FetchMilestoneFamily();

/// See also [fetchMilestone].
class FetchMilestoneFamily extends Family<AsyncValue<MilestoneModel>> {
  /// See also [fetchMilestone].
  const FetchMilestoneFamily();

  /// See also [fetchMilestone].
  FetchMilestoneProvider call({
    required int mileId,
  }) {
    return FetchMilestoneProvider(
      mileId: mileId,
    );
  }

  @override
  FetchMilestoneProvider getProviderOverride(
    covariant FetchMilestoneProvider provider,
  ) {
    return call(
      mileId: provider.mileId,
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
  String? get name => r'fetchMilestoneProvider';
}

/// See also [fetchMilestone].
class FetchMilestoneProvider extends AutoDisposeFutureProvider<MilestoneModel> {
  /// See also [fetchMilestone].
  FetchMilestoneProvider({
    required int mileId,
  }) : this._internal(
          (ref) => fetchMilestone(
            ref as FetchMilestoneRef,
            mileId: mileId,
          ),
          from: fetchMilestoneProvider,
          name: r'fetchMilestoneProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchMilestoneHash,
          dependencies: FetchMilestoneFamily._dependencies,
          allTransitiveDependencies:
              FetchMilestoneFamily._allTransitiveDependencies,
          mileId: mileId,
        );

  FetchMilestoneProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.mileId,
  }) : super.internal();

  final int mileId;

  @override
  Override overrideWith(
    FutureOr<MilestoneModel> Function(FetchMilestoneRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchMilestoneProvider._internal(
        (ref) => create(ref as FetchMilestoneRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        mileId: mileId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<MilestoneModel> createElement() {
    return _FetchMilestoneProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchMilestoneProvider && other.mileId == mileId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, mileId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FetchMilestoneRef on AutoDisposeFutureProviderRef<MilestoneModel> {
  /// The parameter `mileId` of this provider.
  int get mileId;
}

class _FetchMilestoneProviderElement
    extends AutoDisposeFutureProviderElement<MilestoneModel>
    with FetchMilestoneRef {
  _FetchMilestoneProviderElement(super.provider);

  @override
  int get mileId => (origin as FetchMilestoneProvider).mileId;
}

String _$fetchProjectMilestonesHash() =>
    r'be3681d68179be9dc470fef19a6df55bb336aadb';

/// See also [fetchProjectMilestones].
@ProviderFor(fetchProjectMilestones)
const fetchProjectMilestonesProvider = FetchProjectMilestonesFamily();

/// See also [fetchProjectMilestones].
class FetchProjectMilestonesFamily
    extends Family<AsyncValue<List<MilestoneModel>>> {
  /// See also [fetchProjectMilestones].
  const FetchProjectMilestonesFamily();

  /// See also [fetchProjectMilestones].
  FetchProjectMilestonesProvider call({
    required int proId,
  }) {
    return FetchProjectMilestonesProvider(
      proId: proId,
    );
  }

  @override
  FetchProjectMilestonesProvider getProviderOverride(
    covariant FetchProjectMilestonesProvider provider,
  ) {
    return call(
      proId: provider.proId,
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
  String? get name => r'fetchProjectMilestonesProvider';
}

/// See also [fetchProjectMilestones].
class FetchProjectMilestonesProvider
    extends AutoDisposeFutureProvider<List<MilestoneModel>> {
  /// See also [fetchProjectMilestones].
  FetchProjectMilestonesProvider({
    required int proId,
  }) : this._internal(
          (ref) => fetchProjectMilestones(
            ref as FetchProjectMilestonesRef,
            proId: proId,
          ),
          from: fetchProjectMilestonesProvider,
          name: r'fetchProjectMilestonesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchProjectMilestonesHash,
          dependencies: FetchProjectMilestonesFamily._dependencies,
          allTransitiveDependencies:
              FetchProjectMilestonesFamily._allTransitiveDependencies,
          proId: proId,
        );

  FetchProjectMilestonesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.proId,
  }) : super.internal();

  final int proId;

  @override
  Override overrideWith(
    FutureOr<List<MilestoneModel>> Function(FetchProjectMilestonesRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchProjectMilestonesProvider._internal(
        (ref) => create(ref as FetchProjectMilestonesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        proId: proId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<MilestoneModel>> createElement() {
    return _FetchProjectMilestonesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchProjectMilestonesProvider && other.proId == proId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, proId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FetchProjectMilestonesRef
    on AutoDisposeFutureProviderRef<List<MilestoneModel>> {
  /// The parameter `proId` of this provider.
  int get proId;
}

class _FetchProjectMilestonesProviderElement
    extends AutoDisposeFutureProviderElement<List<MilestoneModel>>
    with FetchProjectMilestonesRef {
  _FetchProjectMilestonesProviderElement(super.provider);

  @override
  int get proId => (origin as FetchProjectMilestonesProvider).proId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
