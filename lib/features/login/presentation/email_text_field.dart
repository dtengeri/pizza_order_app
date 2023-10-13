import 'package:flutter/material.dart';

class EmailTextField extends StatefulWidget {
  const EmailTextField({super.key});

  @override
  State<EmailTextField> createState() => _EmailTextFieldState();
}

class _EmailTextFieldState extends State<EmailTextField> {
  String? _errorText;

  void _validate(String value) {
    if (value.isEmpty) {
      setState(() {
        _errorText = 'Email is missing';
      });
      return;
    }
    setState(() {
      _errorText = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: _validate,
      decoration: InputDecoration(
        label: const Text('Email'),
        icon: const Icon(Icons.email),
        errorText: _errorText,
      ),
    );
  }
}
