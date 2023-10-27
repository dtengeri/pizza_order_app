import 'package:flutter/material.dart';

class NameTextField extends StatelessWidget {
  const NameTextField({
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
        label: const Text('Name'),
        icon: const Icon(Icons.person),
        errorText: errorText,
      ),
    );
  }
}
