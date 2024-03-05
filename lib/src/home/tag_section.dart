import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task/src/tasks/task_repo.dart';
import 'package:task/src/widgets/colors.dart';
import '../widgets/icons.dart';

class MyTagSection extends ConsumerWidget {
  final String filter;
  final String title;
  final String iconColor;
  const MyTagSection({
    Key? key,
    required this.filter,
    required this.title,
    required this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskList = ref.watch(filterTasksProvider(filter: filter));
    return Card(
      color: AppColor.whiteColor,
      clipBehavior: Clip.hardEdge,
      elevation: 0,
      child: InkWell(
        onTap: () {},
        child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.89,
            height: MediaQuery.of(context).size.width * 0.08,
            child: Padding(
                padding: const EdgeInsets.only(right: 16, left: 8),
                child: taskList.when(
                  data: (data) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            MyDefaultIcon(
                                svgFile: 'assets/icons/${iconColor}flag.svg'),
                            Text(
                              title,
                              style: Theme.of(context).textTheme.bodyMedium!,
                            ),
                          ],
                        ),
                        Text(
                          '${data.length} tasks',
                          style: Theme.of(context).textTheme.displaySmall!,
                        )
                      ],
                    );
                  },
                  error: (err, stack) => Text('Error $err'),
                  loading: () {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ))),
      ),
    );
  }
}
