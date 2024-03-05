// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:percent_indicator/percent_indicator.dart';
// import 'package:task/src/create/create_subtask.dart';
// import 'package:task/src/subtasks/subtask_provider.dart';
// import 'package:task/src/subtasks/subtask_tile.dart';
// import 'package:task/src/widgets/colors.dart';

// class MySubtaskList extends ConsumerStatefulWidget {
//   final int taskId;
//   const MySubtaskList(this.taskId, {Key? key}) : super(key: key);

//   @override
//   ConsumerState<MySubtaskList> createState() => _MySubtaskListState();
// }

// class _MySubtaskListState extends ConsumerState<MySubtaskList> {
//   int counter = 0;

//   callback(counter) {
//     setState(() {
//       counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final subtaskProvider = subtaskFamily(widget.taskId);
//     final data = ref.watch(subtaskProvider);

//     return Consumer(
//       builder: (context, watch, child) {
//         final data = watch(subtaskProvider);

//         return Container(
//           // ... Your existing code ...
//           child: data.when(
//             // ... Your existing code ...
//           ),
//         );
//       },
//     );
//   }
// }
