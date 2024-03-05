import 'package:flutter/material.dart';
import 'package:task/src/routing/app_router.dart';
import 'package:task/src/widgets/colors.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: goRouter,
      theme: ThemeData(
        primaryColor: AppColor.purpleColor,
        useMaterial3: true,
        fontFamily: 'Nunito',
        appBarTheme:
            const AppBarTheme(backgroundColor: AppColor.backgroundColor),
        scaffoldBackgroundColor: AppColor.backgroundColor,
        inputDecorationTheme: const InputDecorationTheme(
            labelStyle: TextStyle(color: AppColor.grayColor),
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              borderSide: BorderSide(color: Colors.transparent),
            )),
        textTheme: const TextTheme(
            headlineLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            bodyMedium: TextStyle(fontSize: 16),
            displaySmall: TextStyle(fontSize: 14, color: AppColor.grayColor),
            headlineSmall: TextStyle(fontSize: 14),
            bodySmall: TextStyle(fontSize: 16, color: AppColor.grayColor)),
      ),
    );
  }
}
