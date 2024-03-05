import 'package:flutter/material.dart';
import 'package:task/src/subtasks/subtask_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task/src/tasks/task_repo.dart';
import 'package:task/src/widgets/description_card.dart';

class MyTaskScreen extends ConsumerWidget {
  final int taskId;
  const MyTaskScreen({super.key, required this.taskId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(fetchTaskProvider(taskId: taskId));
    return Scaffold(
        appBar: AppBar(
          title: const Text('Task'),
          centerTitle: true,
        ),
        body: data.when(
            data: (data) {
              return Center(
                child: Column(
                  children: [
                    MyDescCard(
                      title: data.title,
                      description: data.description,
                      id: taskId,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    MySubtaskList(taskId)
                  ],
                ),
              );
            },
            error: (Object error, StackTrace stackTrace) {
              error.toString();
              return null;
            },
            loading: () => const Center(
                  child: CircularProgressIndicator(),
                )));
  }
}
