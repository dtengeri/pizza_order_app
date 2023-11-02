import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pizza_order_app/features/auth/application/auth_controller.dart';
import 'package:pizza_order_app/features/core/domain/user.dart';
import 'package:pizza_order_app/features/login/domain/login_form.dart';
import 'package:pizza_order_app/features/login/infrastructure/providers.dart';

class LoginController extends Notifier<LoginForm> {
  @override
  LoginForm build() {
    return const LoginForm(
      email: '',
      password: '',
    );
  }

  void updateEmail(String email) {
    state = state.copyWith(email: email);
  }

  void updatePassword(String password) {
    state = state.copyWith(password: password);
  }

  Future<User> login() async {
    if (!state.isValid) {
      throw Exception('form not valid');
    }
    final user = await ref.read(loginRepositoryProvider).login(
          email: state.email,
          password: state.password,
        );
    await ref.read(authControllerProvider.notifier).signInWithEmailAndPassword(
          email: state.email,
          password: state.password,
        );
    return user;
  }
}

final loginControllerProvider = NotifierProvider<LoginController, LoginForm>(
  () => LoginController(),
);
