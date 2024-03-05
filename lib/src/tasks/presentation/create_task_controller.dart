import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:task/src/tasks/task_repo.dart';

part 'create_task_controller.g.dart';

@riverpod
class CreateTaskController extends _$CreateTaskController {
  @override
  FutureOr<void> build() {}

  Future<void> createTask({
    required String title,
    required String description,
    required String dueDate,
    required String startDate,
    required List users,
    required List deps,
    required void Function() onSuccess,
  }) async {
    final taskRepo = ref.read(taskRepositoryProvider);
    try {
      state = const AsyncLoading().copyWithPrevious(state);
      final result = await AsyncValue.guard(() => taskRepo.createTaskRepository(
            title: title,
            description: description,
            dueDate: dueDate,
            startDate: startDate,
            stage: 'INPROGRESS',
            weight: 1,
            users: users,
            deps: deps,
          ));
      state = result;
      if (!result.hasError) {
        onSuccess();
      } else {}
    } catch (error) {
      state = AsyncError(error, StackTrace.current);
    }
  }

  Future<void> deleteTask({
    required int taskId,
    required void Function() onSuccess,
  }) async {
    final taskRepo = ref.read(taskRepositoryProvider);
    try {
      state = const AsyncLoading();
      final result =
          await AsyncValue.guard(() => taskRepo.deleteTask(taskId: taskId));

      state = result;
      if (result is AsyncData && !result.hasError) {
        onSuccess();
      }
    } catch (error) {
      state = AsyncError(error, StackTrace.current);
    }
  }
}
