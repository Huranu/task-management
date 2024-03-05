import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:task/src/tasks/domain/task_model.dart';
import 'package:task/src/tasks/task_card.dart';
import 'package:task/src/tasks/task_repo.dart';

class MyTaskList extends ConsumerWidget {
  final String title;
  final int? depId;
  final int? proId;
  final int? mileId;
  final int? sprintId;
  const MyTaskList(
      {super.key,
      required this.title,
      this.depId,
      this.mileId,
      this.proId,
      this.sprintId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<TaskModel>> taskList;
    if (depId != null) {
      taskList = ref.watch(depTaskStreamProvider(depId!));
    } else if (mileId != null) {
      taskList = ref.watch(taskStreamProvider('milestone_id=$mileId'));
    } else if (proId != null) {
      taskList = ref.watch(taskStreamProvider('project_id=$proId'));
    } else if (sprintId != null) {
      taskList = ref.watch(taskStreamProvider('sprint_id=$sprintId'));
    } else {
      taskList = ref.watch(taskStreamProvider(''));
    }
    return Padding(
        padding: const EdgeInsets.only(left: 20),
        child: taskList.when(
            data: (data) {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(title,
                              style:
                                  Theme.of(context).textTheme.headlineLarge!),
                          Text("${data.length} tasks",
                              style: Theme.of(context).textTheme.displaySmall!),
                        ],
                      ),
                      ElevatedButton(
                          onPressed: () {
                            context.push('/create-task');
                          },
                          child: Text('Add task'))
                    ],
                  ),
                  SizedBox(
                    height: 230,
                    child: ListView.builder(
                      itemBuilder: (BuildContext context, int index) {
                        return TaskCard(
                          date: data[index].dueDate,
                          title: data[index].title,
                          taskId: data[index].id!,
                        );
                      },
                      itemCount: data.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                    ),
                  )
                ],
              );
            },
            error: (err, stack) => Text('Error $err'),
            loading: () {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }));
  }
}
