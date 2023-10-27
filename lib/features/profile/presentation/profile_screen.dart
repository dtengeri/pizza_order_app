import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pizza_order_app/features/auth/application/auth_controller.dart';
import 'package:pizza_order_app/features/auth/domain/auth_state.dart';
import 'package:pizza_order_app/features/core/domain/user.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authControllerProvider);

    return Scaffold(
      body: switch (authState) {
        Unauthenticated() => const _Unauthenticated(),
        Authenticated(:final user) => _ProfileDetails(user: user),
      },
    );
  }
}

class _ProfileDetails extends StatelessWidget {
  const _ProfileDetails({
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Welcome ${user.name}!'),
        ElevatedButton(
          onPressed: () {
            context.go('/pizzas');
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
    );
  }
}

class _Unauthenticated extends StatelessWidget {
  const _Unauthenticated();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('You are not logged in'),
        ElevatedButton(
          onPressed: () {
            context.go('/sign-up');
          },
          child: const Text('Sign up'),
        ),
        ElevatedButton(
          onPressed: () {
            context.go('/');
          },
          child: const Text('Login'),
        ),
      ],
    );
  }
}
