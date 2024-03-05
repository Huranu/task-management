// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$projectRepositoryHash() => r'9c62dbed1d3ea9dea8869d3beac7eddc66c1cefd';

/// See also [projectRepository].
@ProviderFor(projectRepository)
final projectRepositoryProvider =
    AutoDisposeProvider<ProjectRepository>.internal(
  projectRepository,
  name: r'projectRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$projectRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ProjectRepositoryRef = AutoDisposeProviderRef<ProjectRepository>;
String _$fetchProjectHash() => r'9b76234c289b83a690647e3ea33c7d2d0acb856e';

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

/// See also [fetchProject].
@ProviderFor(fetchProject)
const fetchProjectProvider = FetchProjectFamily();

/// See also [fetchProject].
class FetchProjectFamily extends Family<AsyncValue<ProjectModel>> {
  /// See also [fetchProject].
  const FetchProjectFamily();

  /// See also [fetchProject].
  FetchProjectProvider call({
    required int proId,
  }) {
    return FetchProjectProvider(
      proId: proId,
    );
  }

  @override
  FetchProjectProvider getProviderOverride(
    covariant FetchProjectProvider provider,
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
  String? get name => r'fetchProjectProvider';
}

/// See also [fetchProject].
class FetchProjectProvider extends AutoDisposeFutureProvider<ProjectModel> {
  /// See also [fetchProject].
  FetchProjectProvider({
    required int proId,
  }) : this._internal(
          (ref) => fetchProject(
            ref as FetchProjectRef,
            proId: proId,
          ),
          from: fetchProjectProvider,
          name: r'fetchProjectProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchProjectHash,
          dependencies: FetchProjectFamily._dependencies,
          allTransitiveDependencies:
              FetchProjectFamily._allTransitiveDependencies,
          proId: proId,
        );

  FetchProjectProvider._internal(
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
    FutureOr<ProjectModel> Function(FetchProjectRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchProjectProvider._internal(
        (ref) => create(ref as FetchProjectRef),
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
  AutoDisposeFutureProviderElement<ProjectModel> createElement() {
    return _FetchProjectProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchProjectProvider && other.proId == proId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, proId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FetchProjectRef on AutoDisposeFutureProviderRef<ProjectModel> {
  /// The parameter `proId` of this provider.
  int get proId;
}

class _FetchProjectProviderElement
    extends AutoDisposeFutureProviderElement<ProjectModel>
    with FetchProjectRef {
  _FetchProjectProviderElement(super.provider);

  @override
  int get proId => (origin as FetchProjectProvider).proId;
}

String _$fetchProjectsHash() => r'd86693598e7570295331c35590126763954bcb86';

/// See also [fetchProjects].
@ProviderFor(fetchProjects)
final fetchProjectsProvider =
    AutoDisposeFutureProvider<List<ProjectModel>>.internal(
  fetchProjects,
  name: r'fetchProjectsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchProjectsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchProjectsRef = AutoDisposeFutureProviderRef<List<ProjectModel>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
