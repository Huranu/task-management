import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task/src/milestones/milestone_repo.dart';
import 'package:task/src/widgets/big_card.dart';

class MyMilestoneList extends ConsumerWidget {
  final String title;
  final int id;
  const MyMilestoneList({super.key, required this.title, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final milestoneList = ref.watch(fetchProjectMilestonesProvider(proId: id));
    return Padding(
        padding: const EdgeInsets.only(left: 20),
        child: milestoneList.when(
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
                          Text("${data.length} milestones",
                              style: Theme.of(context).textTheme.displaySmall!),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 230,
                    child: ListView.builder(
                      itemBuilder: (BuildContext context, int index) {
                        return BigCard(
                          date: data[index].dueDate,
                          title: data[index].title,
                          id: data[index].id,
                          type: 'milestone',
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
