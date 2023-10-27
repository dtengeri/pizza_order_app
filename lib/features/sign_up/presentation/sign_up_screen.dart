import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pizza_order_app/features/core/presentation/email_text_field.dart';
import 'package:pizza_order_app/features/core/presentation/name_text_field.dart';
import 'package:pizza_order_app/features/core/presentation/password_text_field.dart';
import 'package:pizza_order_app/features/sign_up/application/sign_up_controller.dart';

class SignUpScreen extends ConsumerWidget {
  const SignUpScreen({super.key});

  Future<void> _onSubmit(WidgetRef ref) async {
    final scaffoldMessenger = ScaffoldMessenger.of(ref.context);
    final router = GoRouter.of(ref.context);
    final signUpController = ref.read(signUpControllerProvider.notifier);
    try {
      final user = await signUpController.signUp();
      scaffoldMessenger.showSnackBar(
        SnackBar(
          content: Text('Signed up as ${user.email}'),
        ),
      );
      router.go('/pizzas');
    } catch (e) {
      scaffoldMessenger.showSnackBar(
        const SnackBar(
          content: Text('Failed to sign up'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signUpForm = ref.watch(signUpControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign up'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          NameTextField(
            onChanged: ref.read(signUpControllerProvider.notifier).updateName,
            errorText: signUpForm.nameErrorText,
          ),
          EmailTextField(
            onChanged: ref.read(signUpControllerProvider.notifier).updateEmail,
            errorText: signUpForm.emailErrorText,
          ),
          PasswordTextField(
            onChanged:
                ref.read(signUpControllerProvider.notifier).updatePassword,
            errorText: signUpForm.passwordErrorText,
          ),
          PasswordTextField(
            label: 'Confirm password',
            onChanged: ref
                .read(signUpControllerProvider.notifier)
                .updateConfirmPassword,
            errorText: signUpForm.confirmPasswordErrorText,
          ),
          ElevatedButton(
            onPressed: signUpForm.isValid ? () => _onSubmit(ref) : null,
            child: const Text('Sign up'),
          ),
        ],
      ),
    );
  }
}
