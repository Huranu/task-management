import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:task/src/subtasks/subtask_model.dart';
import 'package:task/src/subtasks/subtask_repo.dart';

part 'subtask_services.g.dart';

class SubtaskServices {
  SubtaskServices(this.ref);

  final Ref ref;
  Future<List<SubtaskModel>> fetchSubtasks(
      {required int taskId, String? filter}) {
    return ref
        .read(subtaskRepositoryProvider)
        .subtasks(taskId: taskId, filter: filter);
  }

  Future<void> setSubtasks({required int taskId, required String title}) {
    print(title);
    return ref
        .read(subtaskRepositoryProvider)
        .createSubtask(title: title, taskId: taskId);
  }

  Future<void> updateSubtasks(
      {required int taskId, required int subId, required bool status}) {
    return ref
        .read(subtaskRepositoryProvider)
        .updateSubtask(taskId: taskId, subId: subId, status: status);
  }

  // Future<void> createSubtask({
  //   required String title,
  //   required int taskId,
  // }) async {
  //   await setSubtasks(taskId: taskId, title: title);
  // }

  // Future<void> putSubtask(
  //     {required int taskId, required int subId, required bool status}) async {
  //   await updateSubtasks(
  //     taskId: taskId,
  //     subId: subId,
  //     status: status,
  //   );
  // }
}

@Riverpod(keepAlive: true)
SubtaskServices subtaskServices(SubtaskServicesRef ref) {
  return SubtaskServices(ref);
}
