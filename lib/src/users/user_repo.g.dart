// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userRepositoryHash() => r'ca9e3f79d7bcecd93b90ac8cd06f02ffc3918bbf';

/// See also [userRepository].
@ProviderFor(userRepository)
final userRepositoryProvider = AutoDisposeProvider<UserRepository>.internal(
  userRepository,
  name: r'userRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UserRepositoryRef = AutoDisposeProviderRef<UserRepository>;
String _$fetchUsersHash() => r'eaa91da507790a900ae34b57d6deafd1d33aa846';

/// See also [fetchUsers].
@ProviderFor(fetchUsers)
final fetchUsersProvider = AutoDisposeFutureProvider<List<UserModel>>.internal(
  fetchUsers,
  name: r'fetchUsersProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$fetchUsersHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchUsersRef = AutoDisposeFutureProviderRef<List<UserModel>>;
String _$fetchTaskUsersHash() => r'cfd22e95fee07122c303f156ce31565370dca8db';

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

/// See also [fetchTaskUsers].
@ProviderFor(fetchTaskUsers)
const fetchTaskUsersProvider = FetchTaskUsersFamily();

/// See also [fetchTaskUsers].
class FetchTaskUsersFamily extends Family<AsyncValue<List<UserModel>>> {
  /// See also [fetchTaskUsers].
  const FetchTaskUsersFamily();

  /// See also [fetchTaskUsers].
  FetchTaskUsersProvider call({
    required int taskId,
  }) {
    return FetchTaskUsersProvider(
      taskId: taskId,
    );
  }

  @override
  FetchTaskUsersProvider getProviderOverride(
    covariant FetchTaskUsersProvider provider,
  ) {
    return call(
      taskId: provider.taskId,
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
  String? get name => r'fetchTaskUsersProvider';
}

/// See also [fetchTaskUsers].
class FetchTaskUsersProvider
    extends AutoDisposeFutureProvider<List<UserModel>> {
  /// See also [fetchTaskUsers].
  FetchTaskUsersProvider({
    required int taskId,
  }) : this._internal(
          (ref) => fetchTaskUsers(
            ref as FetchTaskUsersRef,
            taskId: taskId,
          ),
          from: fetchTaskUsersProvider,
          name: r'fetchTaskUsersProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchTaskUsersHash,
          dependencies: FetchTaskUsersFamily._dependencies,
          allTransitiveDependencies:
              FetchTaskUsersFamily._allTransitiveDependencies,
          taskId: taskId,
        );

  FetchTaskUsersProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.taskId,
  }) : super.internal();

  final int taskId;

  @override
  Override overrideWith(
    FutureOr<List<UserModel>> Function(FetchTaskUsersRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchTaskUsersProvider._internal(
        (ref) => create(ref as FetchTaskUsersRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        taskId: taskId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<UserModel>> createElement() {
    return _FetchTaskUsersProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchTaskUsersProvider && other.taskId == taskId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, taskId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FetchTaskUsersRef on AutoDisposeFutureProviderRef<List<UserModel>> {
  /// The parameter `taskId` of this provider.
  int get taskId;
}

class _FetchTaskUsersProviderElement
    extends AutoDisposeFutureProviderElement<List<UserModel>>
    with FetchTaskUsersRef {
  _FetchTaskUsersProviderElement(super.provider);

  @override
  int get taskId => (origin as FetchTaskUsersProvider).taskId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
