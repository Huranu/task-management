import 'package:flutter/material.dart';
import 'package:task/src/milestones/milestone_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task/src/sprints/sprint_list.dart';
import 'package:task/src/tasks/task_list.dart';
import 'package:task/src/widgets/description_card.dart';

class MyMilestoneScreen extends ConsumerWidget {
  final int mileId;
  const MyMilestoneScreen({super.key, required this.mileId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final milestone = ref.watch(fetchMilestoneProvider(mileId: mileId));
    return Scaffold(
        appBar: AppBar(
          title: const Text('Milestone'),
          centerTitle: true,
        ),
        body: milestone.when(
            data: (data) {
              return SingleChildScrollView(
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MyDescCard(
                      title: data.title,
                      description: data.description,
                      id: mileId,
                    ),
                    MySprintList(
                      title: 'All sprints',
                      type: 'project',
                      id: mileId,
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
