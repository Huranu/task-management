import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyDatePicker extends StatelessWidget {
  const MyDatePicker(
      {super.key, required this.title, required this.dateController});
  final String title;
  final TextEditingController dateController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.89,
      height: MediaQuery.of(context).size.height * 0.064,
      child: TextField(
        controller: dateController,
        decoration: InputDecoration(
            prefixIcon: const Icon(Icons.calendar_today), labelText: title),
        readOnly: true,
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2101));

          if (pickedDate != null) {
            String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
            dateController.text = formattedDate;
          } else {}
        },
      ),
    );
  }
}
