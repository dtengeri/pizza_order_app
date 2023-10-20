import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pizza_order_app/features/core/domain/user.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Welcome ${user.name}!'),
          ElevatedButton(
            onPressed: () {
              context.go('/pizzas?email=${user.email}&name=${user.name}');
            },
            child: const Text('Back to pizzas'),
          ),
          ElevatedButton(
            onPressed: () {
              context.go('/');
            },
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}
