import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:task/src/subtasks/subtask_services.dart';

part 'create_subtask_controller.g.dart';

@riverpod
class CreateSubtaskController extends _$CreateSubtaskController {
  @override
  FutureOr<void> build() {
    // ref.onDispose(() => mounted = false);
  }

  Future<void> createSubtask({
    required int taskId,
    required String title,
    required void Function() onSuccess,
  }) async {
    final subtaskServices = ref.read(subtaskServicesProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(
        () => subtaskServices.setSubtasks(taskId: taskId, title: title));
    if (state.hasError == false) {
      onSuccess();
    }
  }

  Future<void> updateSubtask(
      {required int taskId, required int subId, required bool status}) async {
    final subtaskServices = ref.read(subtaskServicesProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => subtaskServices.updateSubtasks(
          taskId: taskId,
          subId: subId,
          status: status,
        ));
  }
}
