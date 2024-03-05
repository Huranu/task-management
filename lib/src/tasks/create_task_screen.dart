import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:task/src/create/popup_button.dart';
import 'package:task/src/tasks/presentation/create_task_controller.dart';
import 'package:task/src/users/user_repo.dart';
import 'package:task/src/widgets/colors.dart';
import 'package:task/src/widgets/date_picker.dart';
import 'package:task/src/widgets/multi_dropdown_textfield.dart';
import 'package:task/src/widgets/textfield.dart';
import 'package:task/src/workspaces/department_repo.dart';

class CreateTaskScreen extends ConsumerWidget {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final startController = TextEditingController();
  final dueController = TextEditingController();
  final nameController = TextEditingController();
  final depController = MultiSelectController();
  final userController = MultiSelectController();
  final tagController = MultiSelectController();

  CreateTaskScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<void> state = ref.watch(createTaskControllerProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Create task'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Consumer(
              builder: (context, ref, child) {
                final departments = ref.watch(fetchDepartmentsProvider);
                return MyDropdownTextfield(
                  hintString: 'Department',
                  buttonWidth: 0.89,
                  options: departments.when(
                      data: (data) {
                        return data
                            .map((e) => ValueItem(label: e.name, value: e.id))
                            .toList();
                      },
                      error: (error, stackTrace) => [],
                      loading: () => []),
                  controller: depController,
                );
              },
            ),
            FilledTextField(
              hintText: 'task title',
              title: 'Title',
              controller: titleController,
              keyboardType: TextInputType.multiline,
            ),
            FilledTextField(
              hintText: 'task description',
              title: 'Description',
              controller: descriptionController,
              keyboardType: TextInputType.multiline,
            ),
            MyDatePicker(
              title: "Start Date",
              dateController: startController,
            ),
            MyDatePicker(
              title: "Due date",
              dateController: dueController,
            ),
            Consumer(
              builder: (context, ref, child) {
                final users = ref.watch(fetchUsersProvider);
                return MyDropdownTextfield(
                  hintString: 'Assigned to',
                  buttonWidth: 0.89,
                  options: users.when(
                      data: (data) {
                        return data
                            .map((e) => ValueItem(label: e.email, value: e.id))
                            .toList();
                      },
                      error: (error, stackTrace) => [],
                      loading: () => []),
                  controller: userController,
                );
              },
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.89,
              height: MediaQuery.of(context).size.width * 0.08,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MyDropdownTextfield(
                    hintString: "Tag",
                    buttonWidth: 0.65,
                    options: const [ValueItem(label: 'yo', value: 1)],
                    controller: tagController,
                  ),
                  const MyPopupButton(),
                ],
              ),
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.89,
                height: MediaQuery.of(context).size.height * 0.064,
                child: ElevatedButton(
                    onPressed: state.isLoading
                        ? null
                        : () async {
                            final deps = depController.selectedOptions
                                .map((e) => e.value)
                                .toList();
                            final users = userController.selectedOptions
                                .map((e) => e.value)
                                .toList();
                            await ref
                                .read(createTaskControllerProvider.notifier)
                                .createTask(
                                  title: titleController.text,
                                  description: descriptionController.text,
                                  dueDate: dueController.text,
                                  startDate: startController.text,
                                  users: users,
                                  deps: deps,
                                  onSuccess: () {
                                    context.pop();
                                  },
                                );
                          },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.purpleColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        )),
                    child: Text(
                      'Create task',
                      style:
                          Theme.of(context).textTheme.headlineLarge!.copyWith(
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                    ))),
          ],
        ),
      ),
    );
  }
}
