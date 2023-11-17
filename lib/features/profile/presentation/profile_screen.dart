import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pizza_order_app/features/auth/application/auth_controller.dart';
import 'package:pizza_order_app/features/auth/domain/auth_state.dart';
import 'package:pizza_order_app/features/core/domain/user.dart';
import 'package:pizza_order_app/features/core/presentation/app_drawer.dart';
import 'package:pizza_order_app/features/profile/application/profile_controller.dart';
import 'package:pizza_order_app/features/profile/domain/delivery_address.dart';
import 'package:pizza_order_app/features/profile/domain/user_profile.dart';
import 'package:pizza_order_app/features/profile/presentation/add_address_dialog.dart';

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
  late final TextEditingController _phoneTextEditingController;

  Future<void> _updateProfile() async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    await ref.read(profileControllerProvider.notifier).updateProfile(
          widget.userProfile.copyWith(
            phone: _phoneTextEditingController.text,
          ),
        );
    scaffoldMessenger.showSnackBar(
      const SnackBar(
        content: Text('Saved'),
      ),
    );
  }

  Future<void> _addAddress() async {
    final deliveryAddress = await showDialog<DeliveryAddress>(
      context: context,
      builder: (contex) => const AddAddressDialog(),
    );
    if (deliveryAddress != null) {
      ref
          .read(profileControllerProvider.notifier)
          .addDeliveryAddress(deliveryAddress);
    }
  }

  @override
  void initState() {
    super.initState();
    _phoneTextEditingController = TextEditingController(
      text: widget.userProfile.phone,
    );
  }

  @override
  void didUpdateWidget(covariant _ProfileDetails oldWidget) {
    super.didUpdateWidget(oldWidget);
    _phoneTextEditingController.text = widget.userProfile.phone ?? '';
  }

  @override
  void dispose() {
    _phoneTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 75,
          ),
          Text(
            'Welcome ${widget.user.name}!',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          TextField(
            controller: _phoneTextEditingController,
            decoration: const InputDecoration(
              labelText: 'Phone',
            ),
          ),
          const Divider(),
          Row(
            children: [
              const Expanded(
                child: Text('Addresses'),
              ),
              IconButton(
                onPressed: _addAddress,
                icon: const Icon(Icons.add),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.userProfile.addresses.length,
              itemBuilder: (context, index) {
                final address = widget.userProfile.addresses[index];
                return ListTile(
                  title: Text(address.city),
                  subtitle: Text(address.street),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.edit)),
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.delete)),
                    ],
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: _updateProfile,
            child: const Text('Update'),
          ),
        ],
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
