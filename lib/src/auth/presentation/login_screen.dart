import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task/src/auth/data/auth_data_provider.dart';
import 'package:task/src/widgets/main_button.dart';
import 'package:task/src/widgets/textfield.dart';

class MyLogo extends StatelessWidget {
  const MyLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50),
      child: SizedBox(
        height: 120.0,
        width: 120.0,
        child: SvgPicture.asset('assets/icons/darkcloud.svg',
            semanticsLabel: 'Callpro Logo'),
      ),
    );
  }
}

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    passwordController.dispose();
    // super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: _formKey,
      child: Center(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: Flex(
          direction: Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const MyLogo(),
            FilledTextField(
              title: "Email",
              hintText: 'Write your email here',
              preIcon: 'assets/icons/sms.svg',
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 10,
            ),
            FilledTextField(
                title: "Password",
                hintText: 'Write your password here',
                preIcon: 'assets/icons/lock.svg',
                sufIcon: 'assets/icons/eye-slash.svg',
                keyboardType: TextInputType.visiblePassword,
                controller: passwordController),
            Consumer(builder: (context, ref, _) {
              bool isLoading = ref.watch(authNotifierProvider);

              return isLoading
                  ? const CircularProgressIndicator()
                  : MainButton(
                      title: "Login",
                      onPressed: () {
                        ref.read(authNotifierProvider.notifier).login(
                            email: emailController.text,
                            password: passwordController.text,
                            context: context);
                      },
                    );
            }),
          ],
        ),
      )),
    ));
  }
}
