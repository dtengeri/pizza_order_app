import 'package:flutter/material.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({
    super.key,
    this.onChanged,
    this.errorText,
  });

  final ValueChanged<String>? onChanged;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        label: const Text('Email'),
        icon: const Icon(Icons.email),
        errorText: errorText,
      ),
    );
  }
}
