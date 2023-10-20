import 'package:flutter/material.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    super.key,
    this.label = 'Password',
    this.onChanged,
    this.errorText,
  });

  final String label;
  final ValueChanged<String>? onChanged;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        label: Text(label),
        icon: const Icon(Icons.lock),
        errorText: errorText,
      ),
      obscureText: true,
    );
  }
}
