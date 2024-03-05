import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task/src/create/create_subtask_controller.dart';

class MySubtaskTile extends StatelessWidget {
  final int subId;
  final String title;
  final int taskId;
  final bool isSelected;

  const MySubtaskTile({
    Key? key,
    required this.title,
    required this.isSelected,
    required this.subId,
    required this.taskId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.07,
      child: Consumer(
        builder: (context, ref, _) {
          final AsyncValue<void> state =
              ref.watch(createSubtaskControllerProvider);
          return CheckboxListTile(
            title: Text(title),
            value: isSelected,
            onChanged: (bool? value) {
              if (!state.isLoading) {
                ref
                    .read(createSubtaskControllerProvider.notifier)
                    .updateSubtask(
                      taskId: taskId,
                      subId: subId,
                      status: value!,
                    );
              }
            },
          );
        },
      ),
    );
  }
}
