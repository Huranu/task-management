import 'package:flutter/widgets.dart';

class AppColor {
  AppColor._();
  static const Color purpleColor = Color(0xff5f33e1);
  static const Color grayColor = Color(0xffaeaeae);
  static const Color backgroundColor = Color(0xffedf3f6);
  static const Color whiteColor = Color(0xffffffff);
  static const Color strokeColor = Color(0xffefefef);

  static const Gradient linearGradient = LinearGradient(
    begin: Alignment(0.0, 0.0),
    end: Alignment(0.707, -0.707),
    colors: [
      Color(0xffff9a9e),
      Color(0xfffad0c4),
      Color(0xfffad0c4),
    ],
  );
}
