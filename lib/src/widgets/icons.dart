import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyDefaultIcon extends StatelessWidget {
  final double? customPadding;
  final String svgFile;

  const MyDefaultIcon({super.key, required this.svgFile, this.customPadding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(customPadding ?? 8.0),
      child: SvgPicture.asset(
        svgFile,
      ),
    );
  }
}
