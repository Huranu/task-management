// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subtask_repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$subtaskRepositoryHash() => r'96edb8e880bf8ea63819743a322229d9563f8d63';

/// See also [subtaskRepository].
@ProviderFor(subtaskRepository)
final subtaskRepositoryProvider =
    AutoDisposeProvider<SubtaskRepository>.internal(
  subtaskRepository,
  name: r'subtaskRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$subtaskRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SubtaskRepositoryRef = AutoDisposeProviderRef<SubtaskRepository>;
String _$fetchSubtasksHash() => r'0bf674b1564401181878d4ff88f1915ed97624c7';

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

/// See also [fetchSubtasks].
@ProviderFor(fetchSubtasks)
const fetchSubtasksProvider = FetchSubtasksFamily();

/// See also [fetchSubtasks].
class FetchSubtasksFamily extends Family<AsyncValue<List<SubtaskModel>>> {
  /// See also [fetchSubtasks].
  const FetchSubtasksFamily();

  /// See also [fetchSubtasks].
  FetchSubtasksProvider call({
    required int taskId,
  }) {
    return FetchSubtasksProvider(
      taskId: taskId,
    );
  }

  @override
  FetchSubtasksProvider getProviderOverride(
    covariant FetchSubtasksProvider provider,
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
  String? get name => r'fetchSubtasksProvider';
}

/// See also [fetchSubtasks].
class FetchSubtasksProvider
    extends AutoDisposeFutureProvider<List<SubtaskModel>> {
  /// See also [fetchSubtasks].
  FetchSubtasksProvider({
    required int taskId,
  }) : this._internal(
          (ref) => fetchSubtasks(
            ref as FetchSubtasksRef,
            taskId: taskId,
          ),
          from: fetchSubtasksProvider,
          name: r'fetchSubtasksProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchSubtasksHash,
          dependencies: FetchSubtasksFamily._dependencies,
          allTransitiveDependencies:
              FetchSubtasksFamily._allTransitiveDependencies,
          taskId: taskId,
        );

  FetchSubtasksProvider._internal(
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
    FutureOr<List<SubtaskModel>> Function(FetchSubtasksRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchSubtasksProvider._internal(
        (ref) => create(ref as FetchSubtasksRef),
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
  AutoDisposeFutureProviderElement<List<SubtaskModel>> createElement() {
    return _FetchSubtasksProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchSubtasksProvider && other.taskId == taskId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, taskId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FetchSubtasksRef on AutoDisposeFutureProviderRef<List<SubtaskModel>> {
  /// The parameter `taskId` of this provider.
  int get taskId;
}

class _FetchSubtasksProviderElement
    extends AutoDisposeFutureProviderElement<List<SubtaskModel>>
    with FetchSubtasksRef {
  _FetchSubtasksProviderElement(super.provider);

  @override
  int get taskId => (origin as FetchSubtasksProvider).taskId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
