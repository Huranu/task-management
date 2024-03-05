import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task/src/tasks/task_list.dart';
import 'package:task/src/workspaces/department_model.dart';
import 'package:task/src/workspaces/department_repo.dart';
import 'package:task/src/workspaces/project_list.dart';

class MyWorkspaceScreen extends ConsumerStatefulWidget {
  const MyWorkspaceScreen({super.key});

  @override
  ConsumerState<MyWorkspaceScreen> createState() => _MyWorkspaceScreenState();
}

class _MyWorkspaceScreenState extends ConsumerState<MyWorkspaceScreen> {
  DepartmentModel? selectedValue;

  @override
  Widget build(BuildContext context) {
    final departments = ref.watch(fetchDepartmentsProvider);
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                departments.when(
                  data: (data) {
                    final list = data.map<DropdownMenuEntry<DepartmentModel>>(
                        (DepartmentModel dep) {
                      return DropdownMenuEntry<DepartmentModel>(
                        value: dep,
                        label: dep.name,
                      );
                    }).toList();
                    return DropdownMenu<DepartmentModel>(
                      initialSelection: list.first.value,
                      dropdownMenuEntries: list,
                      onSelected: (DepartmentModel? value) =>
                          setState(() => selectedValue = value),
                    );
                  },
                  error: (error, stackTrace) => Text('Error: $error'),
                  loading: () => const CircularProgressIndicator(),
                )
              ],
            ),
          ),
          if (selectedValue != null)
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // MyGridList(taskNumber: null,),
                MyProjectList(
                  title: 'All projects',
                  depId: selectedValue!.id,
                ),
                const SizedBox(
                  height: 20,
                ),
                MyTaskList(
                  title: 'All tasks',
                  depId: selectedValue!.id,
                )
              ],
            )
        ],
      ),
    );
  }
}
