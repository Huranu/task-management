import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task/src/sprints/sprint_repo.dart';
import 'package:task/src/tasks/task_list.dart';
import 'package:task/src/widgets/description_card.dart';

class MySprintScreen extends ConsumerWidget {
  final int sprintId;
  const MySprintScreen({super.key, required this.sprintId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sprint = ref.watch(fetchSprintProvider(sprintId: sprintId));
    return Scaffold(
        appBar: AppBar(
          title: const Text('Sprint'),
          centerTitle: true,
        ),
        body: sprint.when(
            data: (data) {
              return SingleChildScrollView(
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MyDescCard(
                      title: data.title,
                      description: data.description,
                      id: sprintId,
                    ),
                    MyTaskList(
                      title: 'All tasks',
                    )
                  ],
                )),
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
