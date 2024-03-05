import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_screen_controller.g.dart';

@riverpod
class LoginScreenController extends _$LoginScreenController {
  @override
  FutureOr<void> build() {
    // no-op
  }

  Future<void> signInAnonymously() async {
    state = const AsyncLoading();
  }
}
