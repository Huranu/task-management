import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:task/src/auth/application/auth_services.dart';

final authNotifierProvider = StateNotifierProvider<AuthNotifier, bool>(
    (ref) => AuthNotifier(ref.watch(authServiceProvider)));

class AuthNotifier extends StateNotifier<bool> {
  final AuthServices _authServices;
  AuthNotifier(this._authServices) : super(false);

  login(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      state = true;
      await _authServices
          .login(email: email, password: password)
          .then((value) => {context.go('/')});
    } catch (e) {
      state = false;
    }
  }
}
