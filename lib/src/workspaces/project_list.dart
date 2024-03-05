import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task/src/projects/project_repo.dart';
import 'package:task/src/widgets/big_card.dart';

class MyProjectList extends ConsumerWidget {
  final String title;
  final int depId;
  const MyProjectList({super.key, required this.title, required this.depId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectList = ref.watch(projectStreamProvider(depId));
    return Padding(
        padding: const EdgeInsets.only(left: 20),
        child: projectList.when(
            data: (data) {
              return data.isEmpty
                  ? Center(
                      child: Text(
                        'No projects found',
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                    )
                  : Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(title,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge!),
                                Text("${data.length} projects",
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall!),
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
                                type: 'project',
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
