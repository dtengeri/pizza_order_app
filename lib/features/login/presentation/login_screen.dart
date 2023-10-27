import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pizza_order_app/features/core/presentation/email_text_field.dart';
import 'package:pizza_order_app/features/core/presentation/password_text_field.dart';
import 'package:pizza_order_app/features/login/application/login_controller.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginForm = ref.watch(loginControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pizza Order'),
      ),
      body: Column(
        children: [
          const Icon(
            Icons.local_pizza_outlined,
            size: 128,
          ),
          const Text('Welcome!'),
          EmailTextField(
            onChanged: ref.read(loginControllerProvider.notifier).updateEmail,
            errorText: loginForm.emailErrorText,
          ),
          PasswordTextField(
            onChanged:
                ref.read(loginControllerProvider.notifier).updatePassword,
            errorText: loginForm.passwordErrorText,
          ),
          ElevatedButton(
            onPressed: () {
              ref.read(loginControllerProvider.notifier).login();
              context.go('/pizzas');
            },
            child: const Text('Login'),
          ),
          const Divider(),
          const Text('or'),
          TextButton(
            onPressed: () {
              context.go('/sign-up');
            },
            child: const Text('Sign up'),
          ),
        ],
      ),
    );
  }
}
