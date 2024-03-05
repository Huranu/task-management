import 'package:flutter/material.dart';
import 'package:task/src/widgets/colors.dart';

class MainButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const MainButton({super.key, required this.title, this.onPressed});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.89,
          height: MediaQuery.of(context).size.height * 0.064,
          child: ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.purpleColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  )),
              child: Text(
                title,
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
              ))),
    );
  }
}
