import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:task/src/widgets/colors.dart';
import 'package:task/src/widgets/icons.dart';

const List<String> list = <String>['Callpro', 'Lime'];
String? selectedValue = list.first;

class MyDropdownButton extends StatefulWidget {
  const MyDropdownButton({super.key});

  @override
  State<MyDropdownButton> createState() => _MyDropdownButtonState();
}

class _MyDropdownButtonState extends State<MyDropdownButton> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,
        hint: const Row(
          children: [
            MyDefaultIcon(svgFile: 'assets/icons/profile.svg'),
            SizedBox(
              width: 4,
            ),
          ],
        ),
        items: list
            .map((String item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    overflow: TextOverflow.ellipsis,
                  ),
                ))
            .toList(),
        value: selectedValue,
        onChanged: (String? value) {
          setState(() {
            selectedValue = value;
          });
        },
        buttonStyleData: ButtonStyleData(
          height: 36,
          width: 218,
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: AppColor.whiteColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColor.strokeColor),
            // color: Colors.redAccent,
          ),
        ),
      ),
    );
  }
}
