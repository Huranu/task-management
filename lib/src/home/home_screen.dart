import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task/src/home/card_gridlist.dart';
import 'package:task/src/home/tag_section.dart';
import 'package:task/src/tasks/task_list.dart';
import 'package:task/src/tasks/task_repo.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskList = ref.watch(taskStreamProvider(''));
    return Scaffold(
        body: taskList.when(
      data: (tasks) {
        return ListView(
          children: [
            MyGridList(
              taskNumber: tasks.length,
            ),
            const SizedBox(
              height: 20,
            ),
            const Column(
              children: [
                MyTagSection(
                  filter: 'stage=PROPOSED',
                  title: 'Proposed',
                  iconColor: 'purple',
                ),
                MyTagSection(
                  filter: 'stage=INPROGRESS',
                  title: 'In progress',
                  iconColor: 'blue',
                ),
                MyTagSection(
                  filter: 'stage=REVIEW',
                  title: 'In review',
                  iconColor: 'yellow',
                ),
                MyTagSection(
                  filter: 'stage=COMPLETED',
                  title: 'Completed',
                  iconColor: 'green',
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const MyTaskList(
              title: 'My Tasks',
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        );
      },
      error: (err, stack) => Text('Error $err'),
      loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    ));
  }
}
