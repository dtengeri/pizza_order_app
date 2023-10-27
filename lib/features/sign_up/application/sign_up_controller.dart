import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pizza_order_app/features/auth/application/auth_controller.dart';
import 'package:pizza_order_app/features/core/domain/user.dart';
import 'package:pizza_order_app/features/sign_up/domain/sign_up_form.dart';
import 'package:pizza_order_app/features/sign_up/infrastructure/providers.dart';

class SignUpController extends Notifier<SignUpForm> {
  @override
  SignUpForm build() {
    return SignUpForm(
      name: '',
      email: '',
      password: '',
      confirmPassword: '',
    );
  }

  void updateName(String name) {
    state = state.copyWith(name: name);
  }

  void updateEmail(String email) {
    state = state.copyWith(email: email);
  }

  void updatePassword(String password) {
    state = state.copyWith(password: password);
  }

  void updateConfirmPassword(String confirmPassword) {
    state = state.copyWith(confirmPassword: confirmPassword);
  }

  Future<User> signUp() async {
    if (!state.isValid) {
      throw Exception('Invalid form');
    }
    final user = await ref.read(signUpRepositoryProvider).signUp(
          signUpForm: state,
        );
    ref.read(authControllerProvider.notifier).signIn(user);
    return user;
  }
}

final signUpControllerProvider = NotifierProvider<SignUpController, SignUpForm>(
  () => SignUpController(),
);
