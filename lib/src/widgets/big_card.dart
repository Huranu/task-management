import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task/src/widgets/colors.dart';
import 'package:intl/intl.dart';
import 'package:task/src/widgets/icons.dart';

class BigCard extends StatelessWidget {
  final int id;
  final String title;
  final String date;
  final String type;

  const BigCard(
      {Key? key,
      required this.title,
      required this.date,
      required this.id,
      required this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColor.whiteColor,
      clipBehavior: Clip.hardEdge,
      elevation: 0,
      child: InkWell(
        onTap: () {
          context.push('/$type/$id');
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
                    MyDate(date: date)
                  ],
                ))),
      ),
    );
  }
}

class MyDate extends StatelessWidget {
  final String date;

  const MyDate({super.key, required this.date});

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
