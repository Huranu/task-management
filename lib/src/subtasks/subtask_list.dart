import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:task/src/create/create_subtask.dart';
import 'package:task/src/subtasks/subtask_repo.dart';
import 'package:task/src/subtasks/subtask_tile.dart';
import 'package:task/src/widgets/colors.dart';

class MySubtaskList extends ConsumerWidget {
  final int taskId;
  const MySubtaskList(this.taskId, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subtaskStream = ref.watch(subtaskStreamProvider(taskId));
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColor.whiteColor,
        ),
        width: MediaQuery.of(context).size.width * 0.89,
        constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.45),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: subtaskStream.when(
          data: (subtasks) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Consumer(
                    builder: (context, ref, _) {
                      final subtaskFilterStream =
                          ref.watch(subtaskFilterStreamProvider(taskId));
                      return subtaskFilterStream.when(
                        data: (subtaskFilter) {
                          int per = 0;
                          if (subtasks.isNotEmpty && subtaskFilter.isNotEmpty) {
                            per = (subtaskFilter.length * 100 / subtasks.length)
                                .round();
                          }
                          return LinearPercentIndicator(
                            width: MediaQuery.of(context).size.width * 0.5,
                            animation: true,
                            lineHeight:
                                MediaQuery.of(context).size.height * 0.012,
                            animationDuration: 100,
                            percent: per / 100,
                            leading: Text(
                              '${subtasks.length} subtasks',
                              style: const TextStyle(fontSize: 12),
                            ),
                            trailing: Text(
                              "$per%",
                              style: const TextStyle(fontSize: 12),
                            ),

                            // ignore: deprecated_member_use
                            linearStrokeCap: LinearStrokeCap.butt,
                            progressColor: Colors.green,
                          );
                        },
                        error: (error, stackTrace) {
                          throw error.toString();
                        },
                        loading: () => const Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * 0.236),
                  child: ListView.separated(
                    itemCount: subtasks.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return MySubtaskTile(
                        title: subtasks[index].title,
                        isSelected: subtasks[index].status,
                        subId: subtasks[index].id!,
                        taskId: taskId,
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider(
                        color: AppColor.strokeColor,
                      );
                    },
                  ),
                ),
                MySubtaskButton(taskId: taskId),
              ],
            );
          },
          error: (error, stackTrace) {
            throw error.toString();
          },
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        ));
  }
}
