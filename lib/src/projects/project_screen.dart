import 'package:flutter/material.dart';
import 'package:task/src/projects/project_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task/src/sprints/sprint_list.dart';
import 'package:task/src/tasks/task_list.dart';
import 'package:task/src/widgets/description_card.dart';
import 'package:task/src/milestones/milestone_list.dart';

class MyProjectScreen extends ConsumerWidget {
  final int proId;
  const MyProjectScreen({super.key, required this.proId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final project = ref.watch(fetchProjectProvider(proId: proId));
    return Scaffold(
        appBar: AppBar(
          title: const Text('Project'),
          centerTitle: true,
        ),
        body: project.when(
            data: (data) {
              return SingleChildScrollView(
                child: Center(
                    child: Column(
                  children: [
                    MyDescCard(
                      title: data.title,
                      description: data.description,
                      id: proId,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    MyMilestoneList(
                      title: 'All milestones',
                      id: proId,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    MySprintList(
                      title: 'All sprints',
                      type: 'project',
                      id: proId,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    MyTaskList(
                      title: 'All tasks',
                      proId: proId,
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
