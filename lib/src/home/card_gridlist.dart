import 'package:flutter/material.dart';
import 'package:task/src/home/process_card.dart';

class MyGridList extends StatelessWidget {
  final int taskNumber;
  const MyGridList({super.key, required this.taskNumber});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MyProCard(
            label: "All tasks",
            icon: 'assets/icons/lock.svg',
            num: taskNumber,
          ),
          MyProCard(
            label: "All projects",
            icon: 'assets/icons/lock.svg',
            num: taskNumber,
          ),
        ],
      ),
    );
  }
}
