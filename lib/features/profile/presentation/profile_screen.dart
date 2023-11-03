import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pizza_order_app/features/auth/application/auth_controller.dart';
import 'package:pizza_order_app/features/auth/domain/auth_state.dart';
import 'package:pizza_order_app/features/core/domain/user.dart';
import 'package:pizza_order_app/features/core/presentation/app_drawer.dart';
import 'package:pizza_order_app/features/profile/application/profile_controller.dart';
import 'package:pizza_order_app/features/profile/domain/user_profile.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authControllerProvider);

    return Scaffold(
      appBar: AppBar(),
      drawer: const AppDrawer(),
      body: switch (authState) {
        Unknown() => const Center(
            child: CircularProgressIndicator(),
          ),
        Unauthenticated() => const _Unauthenticated(),
        Authenticated(:final user) => _ProfileScreen(user: user),
      },
    );
  }
}

class _ProfileScreen extends ConsumerWidget {
  const _ProfileScreen({
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userProfileAsyncValue = ref.watch(profileControllerProvider);
    return switch (userProfileAsyncValue) {
      AsyncError() => const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Can not load your profile'),
            ],
          ),
        ),
      AsyncData(:final value) => _ProfileDetails(
          user: user,
          userProfile: value,
        ),
      _ => const Center(
          child: CircularProgressIndicator(),
        ),
    };
  }
}

class _ProfileDetails extends ConsumerStatefulWidget {
  const _ProfileDetails({
    required this.user,
    required this.userProfile,
  });

  final User user;
  final UserProfile userProfile;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends ConsumerState<_ProfileDetails> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(
        child: Text('TODO'),
      ),
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
