import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:task/src/widgets/colors.dart';
import 'package:task/src/widgets/textfield.dart';

class MyPopupButton extends StatefulWidget {
  const MyPopupButton({super.key});

  @override
  State<MyPopupButton> createState() => _MyPopupButtonState();
}

class _MyPopupButtonState extends State<MyPopupButton> {
  Color _tempMainColor = Colors.blue;
  Color _mainColor = Colors.blue;

  void _openDialog(String title, Widget content) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(18.0),
          title: Text(title),
          content: content,
          actions: [
            TextButton(
              onPressed: () => context.pop(),
              child: const Text('CANCEL'),
            ),
            TextButton(
              onPressed: () {
                context.pop();
                setState(() => _mainColor = _tempMainColor);
                // ref.read
              },
              child: const Text('SUBMIT'),
            ),
          ],
        );
      },
    );
  }

  void _openFullMaterialColorPicker() async {
    _openDialog(
      "Full Material Color picker",
      MaterialColorPicker(
        colors: fullMaterialColors,
        selectedColor: _mainColor,
        onMainColorChange: (color) =>
            setState(() => _tempMainColor = color as Color),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            scrollable: true,
            title: const Text("Add tag"),
            content: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                child: Column(
                  children: [
                    FilledTextField(
                      hintText: 'tag name',
                      title: 'Name',
                      controller: TextEditingController(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const MyColoredBox(),
                          ElevatedButton(
                              onPressed: () {
                                _openFullMaterialColorPicker();
                              },
                              child: const Text('Choose color'))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.45,
                height: MediaQuery.of(context).size.height * 0.064,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.purpleColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        )),
                    onPressed: () {
                      context.pop();
                    },
                    child: Text(
                      'Create',
                      style:
                          Theme.of(context).textTheme.headlineLarge!.copyWith(
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                    )),
              )
            ],
          ),
        );
      },
      child: const Text('Add tag'),
    );
  }
}

// final colorProvider = Provider<Color>((ref) {
//     return _mainColor;
//   });

class MyColoredBox extends ConsumerWidget {
  const MyColoredBox({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // var color = ref.watch(colorProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        width: 60,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 1, color: AppColor.strokeColor),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
