import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pizza_order_app/features/core/presentation/email_text_field.dart';
import 'package:pizza_order_app/features/core/presentation/password_text_field.dart';
import 'package:pizza_order_app/features/sign_up/application/sign_up_controller.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final SignUpController _signUpController = SignUpController();

  Future<void> _onSubmit() async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    final router = GoRouter.of(context);
    try {
      final user = await _signUpController.signUp();
      scaffoldMessenger.showSnackBar(
        SnackBar(
          content: Text('Signed up as ${user.email}'),
        ),
      );
      router.go('/pizzas?email=${user.email}&name=${user.name}');
    } catch (e) {
      scaffoldMessenger.showSnackBar(
        const SnackBar(
          content: Text('Failed to sign up'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign up'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            onChanged: (value) {
              _signUpController.updateName(value);
              setState(() {});
            },
            decoration: InputDecoration(
              label: const Text('Name'),
              errorText: _signUpController.signUpForm.nameErrorText,
            ),
          ),
          EmailTextField(
            onChanged: (value) {
              _signUpController.updateEmail(value);
              setState(() {});
            },
            errorText: _signUpController.signUpForm.emailErrorText,
          ),
          PasswordTextField(
            onChanged: (value) {
              _signUpController.updatePassword(value);
              setState(() {});
            },
            errorText: _signUpController.signUpForm.passwordErrorText,
          ),
          PasswordTextField(
            label: 'Confirm password',
            onChanged: (value) {
              _signUpController.updateConfirmPassword(value);
              setState(() {});
            },
            errorText: _signUpController.signUpForm.confirmPasswordErrorText,
          ),
          ElevatedButton(
            onPressed: _signUpController.signUpForm.isValid ? _onSubmit : null,
            child: const Text('Sign up'),
          ),
        ],
      ),
    );
  }
}
