import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
// import 'package:go_router/go_router.dart';
import 'package:task/src/tasks/presentation/create_task_controller.dart';
import 'package:task/src/widgets/colors.dart';

class MyDescCard extends StatelessWidget {
  final int id;
  final String title;
  final String description;
  const MyDescCard(
      {super.key,
      required this.title,
      required this.description,
      required this.id});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      constraints: BoxConstraints(
          minHeight: 96, maxWidth: MediaQuery.of(context).size.width * 0.89),
      width: MediaQuery.of(context).size.width * 0.89,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: AppColor.whiteColor),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.headlineLarge!,
                ),
                PopupMenuButton<String>(
                  itemBuilder: (context) {
                    return <PopupMenuEntry<String>>[
                      const PopupMenuItem<String>(
                        value: 'edit',
                        child: Text('Edit'),
                      ),
                      const PopupMenuItem<String>(
                        value: 'delete',
                        child: Text('Delete'),
                      ),
                    ];
                  },
                  onSelected: (value) {
                    if (value == 'edit') {
                      // Navigate to edit screen
                      Navigator.pushNamed(context, '/edit_task');
                    } else if (value == 'delete') {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Confirm Delete'),
                          content: const Text('Энэ даалгаврыг устгах уу?'),
                          actions: [
                            TextButton(
                              onPressed: () => context.pop(),
                              child: const Text('Cancel'),
                            ),
                            Consumer(
                              builder: (context, ref, _) {
                                final AsyncValue<void> state =
                                    ref.watch(createTaskControllerProvider);
                                return TextButton(
                                  onPressed: state.isLoading
                                      ? null
                                      : () => ref
                                          .read(createTaskControllerProvider
                                              .notifier)
                                          .deleteTask(
                                            taskId: id,
                                            onSuccess: () {
                                              context.pop();
                                              context.pop();
                                            },
                                          ),
                                  child: const Text('Устгах'),
                                );
                              },
                            ),
                          ],
                        ),
                      );
                    }
                  },
                )
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              description,
              style: Theme.of(context).textTheme.headlineSmall!,
            )
          ]),
    );
  }
}
