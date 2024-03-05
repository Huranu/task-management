import 'package:flutter/material.dart';

import 'icons.dart';

class FilledTextField extends StatelessWidget {
  final String title;
  final TextInputType? keyboardType;
  final String hintText;
  final String? preIcon;
  final String? sufIcon;
  final TextEditingController controller;

  const FilledTextField({
    super.key,
    required this.title,
    required this.hintText,
    this.preIcon,
    this.sufIcon,
    this.keyboardType,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.89,
      height: MediaQuery.of(context).size.height * 0.13,
      child: SizedBox.expand(
        child: TextFormField(
          keyboardType: keyboardType,
          controller: controller,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
          minLines: 1,
          maxLines: 5,
          decoration: InputDecoration(
              prefixIcon:
                  preIcon != null ? MyDefaultIcon(svgFile: preIcon!) : null,
              hintStyle: Theme.of(context).textTheme.bodySmall!,
              suffixIcon: sufIcon != null
                  ? IconButton(
                      icon: const Icon(Icons.remove_red_eye_outlined),
                      onPressed: () {},
                    )
                  : null,
              labelText: title,
              hintText: hintText),
          // onTap: onTap ,
        ),
      ),
    );
  }
}
