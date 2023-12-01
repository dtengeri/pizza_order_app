import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pizza_order_app/features/core/presentation/email_text_field.dart';
import 'package:pizza_order_app/features/core/presentation/password_text_field.dart';
import 'package:pizza_order_app/features/login/application/login_controller.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  Future<void> _onSubmit(BuildContext context, WidgetRef ref) async {
    final scaffoldMessenger = ScaffoldMessenger.of(ref.context);
    final router = GoRouter.of(ref.context);
    final loginController = ref.read(loginControllerProvider.notifier);
    final localization = AppLocalizations.of(context);
    try {
      await loginController.login();
      scaffoldMessenger.showSnackBar(
        SnackBar(
          content: Text(localization.welcomeBack),
        ),
      );
      router.go('/pizzas');
    } catch (e) {
      scaffoldMessenger.showSnackBar(
        SnackBar(
          content: Text(localization.failedToLogin),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginForm = ref.watch(loginControllerProvider);
    final localization = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(localization.appName),
      ),
      body: Column(
        children: [
          const Icon(
            Icons.local_pizza_outlined,
            size: 128,
          ),
          Text(localization.welcome),
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
              _onSubmit(context, ref);
            },
            child: Text(localization.login),
          ),
          const Divider(),
          Text(localization.or),
          TextButton(
            onPressed: () {
              context.go('/sign-up');
            },
            child: Text(localization.signUp),
          ),
        ],
      ),
    );
  }
}
