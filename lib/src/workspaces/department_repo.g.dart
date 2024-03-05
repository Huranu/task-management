// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'department_repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$departmentRepositoryHash() =>
    r'3c1d52e7f4cd9377f5af47376cb7c352c5c95b41';

/// See also [departmentRepository].
@ProviderFor(departmentRepository)
final departmentRepositoryProvider =
    AutoDisposeProvider<DepartmentRepository>.internal(
  departmentRepository,
  name: r'departmentRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$departmentRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DepartmentRepositoryRef = AutoDisposeProviderRef<DepartmentRepository>;
String _$fetchDepartmentHash() => r'8ae1347ed2b98455f1bba1689d5ac0c12cc0f5ed';

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

/// See also [fetchDepartment].
@ProviderFor(fetchDepartment)
const fetchDepartmentProvider = FetchDepartmentFamily();

/// See also [fetchDepartment].
class FetchDepartmentFamily extends Family<AsyncValue<DepartmentModel>> {
  /// See also [fetchDepartment].
  const FetchDepartmentFamily();

  /// See also [fetchDepartment].
  FetchDepartmentProvider call({
    required int depId,
  }) {
    return FetchDepartmentProvider(
      depId: depId,
    );
  }

  @override
  FetchDepartmentProvider getProviderOverride(
    covariant FetchDepartmentProvider provider,
  ) {
    return call(
      depId: provider.depId,
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
  String? get name => r'fetchDepartmentProvider';
}

/// See also [fetchDepartment].
class FetchDepartmentProvider
    extends AutoDisposeFutureProvider<DepartmentModel> {
  /// See also [fetchDepartment].
  FetchDepartmentProvider({
    required int depId,
  }) : this._internal(
          (ref) => fetchDepartment(
            ref as FetchDepartmentRef,
            depId: depId,
          ),
          from: fetchDepartmentProvider,
          name: r'fetchDepartmentProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchDepartmentHash,
          dependencies: FetchDepartmentFamily._dependencies,
          allTransitiveDependencies:
              FetchDepartmentFamily._allTransitiveDependencies,
          depId: depId,
        );

  FetchDepartmentProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.depId,
  }) : super.internal();

  final int depId;

  @override
  Override overrideWith(
    FutureOr<DepartmentModel> Function(FetchDepartmentRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchDepartmentProvider._internal(
        (ref) => create(ref as FetchDepartmentRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        depId: depId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<DepartmentModel> createElement() {
    return _FetchDepartmentProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchDepartmentProvider && other.depId == depId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, depId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FetchDepartmentRef on AutoDisposeFutureProviderRef<DepartmentModel> {
  /// The parameter `depId` of this provider.
  int get depId;
}

class _FetchDepartmentProviderElement
    extends AutoDisposeFutureProviderElement<DepartmentModel>
    with FetchDepartmentRef {
  _FetchDepartmentProviderElement(super.provider);

  @override
  int get depId => (origin as FetchDepartmentProvider).depId;
}

String _$fetchDepartmentsHash() => r'c75788807e11bd6a1afd8e1efdc362278ee2978b';

/// See also [fetchDepartments].
@ProviderFor(fetchDepartments)
final fetchDepartmentsProvider =
    AutoDisposeFutureProvider<List<DepartmentModel>>.internal(
  fetchDepartments,
  name: r'fetchDepartmentsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchDepartmentsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchDepartmentsRef
    = AutoDisposeFutureProviderRef<List<DepartmentModel>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
