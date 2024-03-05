import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:task/src/users/user_repo.dart';
import 'package:task/src/widgets/colors.dart';
import 'package:intl/intl.dart';
import 'package:avatar_stack/avatar_stack.dart';
import 'package:task/src/widgets/icons.dart';
import 'package:avatar_stack/positions.dart';

List<Color> colors = [
  Colors.redAccent,
  Colors.teal,
  Colors.green,
  Colors.grey,
  Colors.orange,
  Colors.blueAccent
];

class TaskCard extends StatelessWidget {
  final int taskId;
  final String title;
  final String date;
  const TaskCard(
      {Key? key, required this.title, required this.date, required this.taskId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColor.whiteColor,
      clipBehavior: Clip.hardEdge,
      elevation: 0,
      child: InkWell(
        onTap: () {
          context.push('/task/$taskId');
        },
        child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.54,
            height: MediaQuery.of(context).size.height * 0.285,
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.headlineLarge!,
                    ),
                    Consumer(
                      builder: (context, ref, child) {
                        final users =
                            ref.watch(fetchTaskUsersProvider(taskId: taskId));
                        return users.when(
                            data: (users) {
                              if (users.isNotEmpty) {
                                final avatars = users.map((e) {
                                  return e.fname.substring(0, 1) +
                                      e.lname.substring(0, 1);
                                }).toList();
                                return SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.54,
                                  height: 50,
                                  child: WidgetStack(
                                    positions: RestrictedPositions(
                                      maxCoverage: 0.7,
                                      minCoverage: 0.2,
                                    ),
                                    stackedWidgets: [
                                      for (var n = 0; n < avatars.length; n++)
                                        CircleAvatar(
                                          backgroundColor: colors.length < n
                                              ? colors[n]
                                              : colors[n % 5 + 1],
                                          child: Text(avatars[n]),
                                        )
                                    ],
                                    buildInfoWidget: (int surplus) {
                                      return Center(
                                          child: Text(
                                        '+$surplus',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall,
                                      ));
                                    },
                                  ),
                                );
                              } else {
                                return Text(
                                  'No assigned users',
                                  style:
                                      Theme.of(context).textTheme.displaySmall!,
                                );
                              }
                            },
                            error: (err, stack) => Text('Error $err'),
                            loading: () {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            });
                      },
                    ),
                    MyTaskDate(date: date)
                  ],
                ))),
      ),
    );
  }
}

class MyTaskDate extends StatelessWidget {
  final String date;

  const MyTaskDate({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 20,
        child: Row(
          children: [
            const MyDefaultIcon(
              svgFile: 'assets/icons/calendar.svg',
              customPadding: 0,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              DateFormat('E, d MMMM y').format(DateTime.parse(date)),
              style: Theme.of(context).textTheme.displaySmall!,
            ),
          ],
        ));
  }
}
