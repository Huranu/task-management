import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:task/src/create/create_subtask_controller.dart';
import 'package:task/src/widgets/colors.dart';
import 'package:task/src/widgets/icons.dart';
import 'package:task/src/widgets/textfield.dart';

class MySubtaskButton extends ConsumerWidget {
  final int taskId;

  final _formKey = GlobalKey<FormState>();

  MySubtaskButton({
    super.key,
    required this.taskId,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.07,
      child: ElevatedButton.icon(
        icon: const MyDefaultIcon(svgFile: 'assets/icons/add-square.svg'),
        style: const ButtonStyle(
            backgroundColor:
                MaterialStatePropertyAll<Color>(AppColor.whiteColor),
            elevation: MaterialStatePropertyAll(0)),
        label:
            Text('Add subtask', style: Theme.of(context).textTheme.bodyMedium!),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return Form(
                  key: _formKey,
                  child: MyCreateSubtaskForm(
                    taskId: taskId,
                  ));
            },
          );
        },
      ),
    );
  }
}

class MyCreateSubtaskForm extends ConsumerStatefulWidget {
  final int taskId;
  const MyCreateSubtaskForm({
    super.key,
    required this.taskId,
  });

  @override
  ConsumerState<MyCreateSubtaskForm> createState() =>
      _MyCreateSubtaskFormState();
}

class _MyCreateSubtaskFormState extends ConsumerState<MyCreateSubtaskForm> {
  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue>(
      createSubtaskControllerProvider,
      (_, state) {
        if (!state.isLoading && state.hasError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error.toString())),
          );
        }
      },
    );
    return AlertDialog(
      scrollable: true,
      title: Text("Add subtask",
          style: Theme.of(context).textTheme.headlineLarge!),
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          child: Column(
            children: [
              FilledTextField(
                keyboardType: TextInputType.multiline,
                title: 'Title',
                controller: controller,
                hintText: "Enter subtask title",
              ),
            ],
          ),
        ),
      ),
      actions: [
        ElevatedButton(
            onPressed: () {
              context.pop();
              controller.text = '';
            },
            style: const ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll<Color>(AppColor.purpleColor),
                elevation: MaterialStatePropertyAll(0)),
            child: Text(
              "Cancel",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
            )),
        Consumer(builder: (context, ref, _) {
          final AsyncValue<void> state =
              ref.watch(createSubtaskControllerProvider);
          return ElevatedButton(
              onPressed: state.isLoading
                  ? null
                  : () => ref
                      .read(createSubtaskControllerProvider.notifier)
                      .createSubtask(
                        taskId: widget.taskId,
                        title: controller.text,
                        onSuccess: () {
                          context.pop();
                        },
                      ),
              style: const ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll<Color>(AppColor.purpleColor),
                  elevation: MaterialStatePropertyAll(0)),
              child: Text(
                "Create",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
              ));
        }),
      ],
    );
  }
}
