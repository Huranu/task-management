import 'package:flutter/material.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';

class MyDropdownTextfield extends StatelessWidget {
  final double buttonWidth;
  final List<ValueItem<dynamic>> options;
  final MultiSelectController controller;

  const MyDropdownTextfield(
      {super.key,
      required this.hintString,
      required this.buttonWidth,
      required this.options,
      required this.controller});
  final String hintString;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * buttonWidth,
      height: MediaQuery.of(context).size.height * 0.13,
      child: SizedBox.expand(
        child: MultiSelectDropDown(
          borderWidth: 1,
          searchEnabled: true,
          borderColor: Colors.transparent,
          showClearIcon: true,
          controller: controller,
          onOptionSelected: (options) {
            // debugPrint();
          },
          hint: hintString,
          hintStyle: Theme.of(context).textTheme.bodySmall!,
          borderRadius: 16,
          options: options,
          selectionType: SelectionType.multi,
          chipConfig: const ChipConfig(wrapType: WrapType.wrap),
          dropdownHeight: 100,
          optionTextStyle: const TextStyle(fontSize: 16),
          selectedOptionIcon: const Icon(Icons.check_circle),
        ),
      ),
    );
  }
}
