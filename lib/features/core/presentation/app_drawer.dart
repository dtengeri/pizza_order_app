import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pizza_order_app/features/auth/application/auth_controller.dart';
import 'package:pizza_order_app/features/auth/domain/auth_state.dart';

class AppDrawer extends ConsumerWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authControllerProvider);
    return Drawer(
      child: ListView(
        children: [
          if (authState case Unauthenticated()) ...[
            ListTile(
              title: const Text('Login'),
              onTap: () {
                context.go('/login');
              },
            ),
            ListTile(
              title: const Text('Sign up'),
              onTap: () {
                context.go('/sign-up');
              },
            ),
          ],
          if (authState case Authenticated(:final user)) ...[
            ListTile(
              title: Text('Welcome ${user.name}!'),
            ),
            const Divider(),
            ListTile(
              title: const Text('Pizzas'),
              onTap: () {
                context.go('/pizzas');
              },
            ),
            ListTile(
              title: const Text('Profile'),
              onTap: () {
                context.go('/profile');
              },
            ),
            ListTile(
              title: const Text('Logout'),
              onTap: () {
                ref.read(authControllerProvider.notifier).signOut();
                context.go('/');
              },
            ),
          ],
        ],
      ),
    );
  }
}
