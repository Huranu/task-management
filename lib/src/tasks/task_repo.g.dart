// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$taskRepositoryHash() => r'7d447d7aa3237fab00d04b18239d5be23e458183';

/// See also [taskRepository].
@ProviderFor(taskRepository)
final taskRepositoryProvider = AutoDisposeProvider<TaskRepository>.internal(
  taskRepository,
  name: r'taskRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$taskRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TaskRepositoryRef = AutoDisposeProviderRef<TaskRepository>;
String _$fetchTaskHash() => r'1f357c1b3dfba08147a3aa4d641a4babbef4b7fb';

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

/// See also [fetchTask].
@ProviderFor(fetchTask)
const fetchTaskProvider = FetchTaskFamily();

/// See also [fetchTask].
class FetchTaskFamily extends Family<AsyncValue<TaskModel>> {
  /// See also [fetchTask].
  const FetchTaskFamily();

  /// See also [fetchTask].
  FetchTaskProvider call({
    required int taskId,
  }) {
    return FetchTaskProvider(
      taskId: taskId,
    );
  }

  @override
  FetchTaskProvider getProviderOverride(
    covariant FetchTaskProvider provider,
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
  String? get name => r'fetchTaskProvider';
}

/// See also [fetchTask].
class FetchTaskProvider extends AutoDisposeFutureProvider<TaskModel> {
  /// See also [fetchTask].
  FetchTaskProvider({
    required int taskId,
  }) : this._internal(
          (ref) => fetchTask(
            ref as FetchTaskRef,
            taskId: taskId,
          ),
          from: fetchTaskProvider,
          name: r'fetchTaskProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchTaskHash,
          dependencies: FetchTaskFamily._dependencies,
          allTransitiveDependencies: FetchTaskFamily._allTransitiveDependencies,
          taskId: taskId,
        );

  FetchTaskProvider._internal(
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
    FutureOr<TaskModel> Function(FetchTaskRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchTaskProvider._internal(
        (ref) => create(ref as FetchTaskRef),
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
  AutoDisposeFutureProviderElement<TaskModel> createElement() {
    return _FetchTaskProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchTaskProvider && other.taskId == taskId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, taskId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FetchTaskRef on AutoDisposeFutureProviderRef<TaskModel> {
  /// The parameter `taskId` of this provider.
  int get taskId;
}

class _FetchTaskProviderElement
    extends AutoDisposeFutureProviderElement<TaskModel> with FetchTaskRef {
  _FetchTaskProviderElement(super.provider);

  @override
  int get taskId => (origin as FetchTaskProvider).taskId;
}

String _$filterTasksHash() => r'90a6cb99ab1847ff0451a99e2eed0b06d2dc7275';

/// See also [filterTasks].
@ProviderFor(filterTasks)
const filterTasksProvider = FilterTasksFamily();

/// See also [filterTasks].
class FilterTasksFamily extends Family<AsyncValue<List<TaskModel>>> {
  /// See also [filterTasks].
  const FilterTasksFamily();

  /// See also [filterTasks].
  FilterTasksProvider call({
    required String filter,
  }) {
    return FilterTasksProvider(
      filter: filter,
    );
  }

  @override
  FilterTasksProvider getProviderOverride(
    covariant FilterTasksProvider provider,
  ) {
    return call(
      filter: provider.filter,
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
  String? get name => r'filterTasksProvider';
}

/// See also [filterTasks].
class FilterTasksProvider extends AutoDisposeFutureProvider<List<TaskModel>> {
  /// See also [filterTasks].
  FilterTasksProvider({
    required String filter,
  }) : this._internal(
          (ref) => filterTasks(
            ref as FilterTasksRef,
            filter: filter,
          ),
          from: filterTasksProvider,
          name: r'filterTasksProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$filterTasksHash,
          dependencies: FilterTasksFamily._dependencies,
          allTransitiveDependencies:
              FilterTasksFamily._allTransitiveDependencies,
          filter: filter,
        );

  FilterTasksProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.filter,
  }) : super.internal();

  final String filter;

  @override
  Override overrideWith(
    FutureOr<List<TaskModel>> Function(FilterTasksRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FilterTasksProvider._internal(
        (ref) => create(ref as FilterTasksRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        filter: filter,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<TaskModel>> createElement() {
    return _FilterTasksProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FilterTasksProvider && other.filter == filter;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, filter.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FilterTasksRef on AutoDisposeFutureProviderRef<List<TaskModel>> {
  /// The parameter `filter` of this provider.
  String get filter;
}

class _FilterTasksProviderElement
    extends AutoDisposeFutureProviderElement<List<TaskModel>>
    with FilterTasksRef {
  _FilterTasksProviderElement(super.provider);

  @override
  String get filter => (origin as FilterTasksProvider).filter;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
