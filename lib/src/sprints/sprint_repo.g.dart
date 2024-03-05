// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sprint_repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sprintRepositoryHash() => r'514c4b5e349ea21b1d18103b588ae5ebea10cf9d';

/// See also [sprintRepository].
@ProviderFor(sprintRepository)
final sprintRepositoryProvider = AutoDisposeProvider<SprintRepository>.internal(
  sprintRepository,
  name: r'sprintRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$sprintRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SprintRepositoryRef = AutoDisposeProviderRef<SprintRepository>;
String _$fetchSprintHash() => r'c6167302442c80f16fea2a510701af1aaef5eafc';

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

/// See also [fetchSprint].
@ProviderFor(fetchSprint)
const fetchSprintProvider = FetchSprintFamily();

/// See also [fetchSprint].
class FetchSprintFamily extends Family<AsyncValue<SprintModel>> {
  /// See also [fetchSprint].
  const FetchSprintFamily();

  /// See also [fetchSprint].
  FetchSprintProvider call({
    required int sprintId,
  }) {
    return FetchSprintProvider(
      sprintId: sprintId,
    );
  }

  @override
  FetchSprintProvider getProviderOverride(
    covariant FetchSprintProvider provider,
  ) {
    return call(
      sprintId: provider.sprintId,
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
  String? get name => r'fetchSprintProvider';
}

/// See also [fetchSprint].
class FetchSprintProvider extends AutoDisposeFutureProvider<SprintModel> {
  /// See also [fetchSprint].
  FetchSprintProvider({
    required int sprintId,
  }) : this._internal(
          (ref) => fetchSprint(
            ref as FetchSprintRef,
            sprintId: sprintId,
          ),
          from: fetchSprintProvider,
          name: r'fetchSprintProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchSprintHash,
          dependencies: FetchSprintFamily._dependencies,
          allTransitiveDependencies:
              FetchSprintFamily._allTransitiveDependencies,
          sprintId: sprintId,
        );

  FetchSprintProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.sprintId,
  }) : super.internal();

  final int sprintId;

  @override
  Override overrideWith(
    FutureOr<SprintModel> Function(FetchSprintRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchSprintProvider._internal(
        (ref) => create(ref as FetchSprintRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        sprintId: sprintId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<SprintModel> createElement() {
    return _FetchSprintProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchSprintProvider && other.sprintId == sprintId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, sprintId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FetchSprintRef on AutoDisposeFutureProviderRef<SprintModel> {
  /// The parameter `sprintId` of this provider.
  int get sprintId;
}

class _FetchSprintProviderElement
    extends AutoDisposeFutureProviderElement<SprintModel> with FetchSprintRef {
  _FetchSprintProviderElement(super.provider);

  @override
  int get sprintId => (origin as FetchSprintProvider).sprintId;
}

String _$fetchProjectSprintsHash() =>
    r'cf031bca7f4219690bdc73278ac3944e39da4ce8';

/// See also [fetchProjectSprints].
@ProviderFor(fetchProjectSprints)
const fetchProjectSprintsProvider = FetchProjectSprintsFamily();

/// See also [fetchProjectSprints].
class FetchProjectSprintsFamily extends Family<AsyncValue<List<SprintModel>>> {
  /// See also [fetchProjectSprints].
  const FetchProjectSprintsFamily();

  /// See also [fetchProjectSprints].
  FetchProjectSprintsProvider call({
    required int proId,
  }) {
    return FetchProjectSprintsProvider(
      proId: proId,
    );
  }

  @override
  FetchProjectSprintsProvider getProviderOverride(
    covariant FetchProjectSprintsProvider provider,
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
  String? get name => r'fetchProjectSprintsProvider';
}

/// See also [fetchProjectSprints].
class FetchProjectSprintsProvider
    extends AutoDisposeFutureProvider<List<SprintModel>> {
  /// See also [fetchProjectSprints].
  FetchProjectSprintsProvider({
    required int proId,
  }) : this._internal(
          (ref) => fetchProjectSprints(
            ref as FetchProjectSprintsRef,
            proId: proId,
          ),
          from: fetchProjectSprintsProvider,
          name: r'fetchProjectSprintsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchProjectSprintsHash,
          dependencies: FetchProjectSprintsFamily._dependencies,
          allTransitiveDependencies:
              FetchProjectSprintsFamily._allTransitiveDependencies,
          proId: proId,
        );

  FetchProjectSprintsProvider._internal(
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
    FutureOr<List<SprintModel>> Function(FetchProjectSprintsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchProjectSprintsProvider._internal(
        (ref) => create(ref as FetchProjectSprintsRef),
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
  AutoDisposeFutureProviderElement<List<SprintModel>> createElement() {
    return _FetchProjectSprintsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchProjectSprintsProvider && other.proId == proId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, proId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FetchProjectSprintsRef
    on AutoDisposeFutureProviderRef<List<SprintModel>> {
  /// The parameter `proId` of this provider.
  int get proId;
}

class _FetchProjectSprintsProviderElement
    extends AutoDisposeFutureProviderElement<List<SprintModel>>
    with FetchProjectSprintsRef {
  _FetchProjectSprintsProviderElement(super.provider);

  @override
  int get proId => (origin as FetchProjectSprintsProvider).proId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
