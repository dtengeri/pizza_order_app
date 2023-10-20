import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pizza_order_app/features/core/domain/user.dart';

class PizzaListScreen extends StatelessWidget {
  const PizzaListScreen({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pizza Order'),
        actions: [
          IconButton(
            onPressed: () {
              context.go('/profile?email=${user.email}&name=${user.name}');
            },
            icon: const Icon(Icons.person),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Welcome ${user.name}!'),
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
