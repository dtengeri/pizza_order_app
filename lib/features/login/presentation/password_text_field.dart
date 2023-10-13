import 'package:flutter/material.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        label: Text('Password'),
        icon: Icon(Icons.lock),
      ),
      obscureText: true,
    );
  }
}
