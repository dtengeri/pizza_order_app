import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pizza_order_app/features/profile/application/avatar_controller.dart';

class ProfileAvatar extends ConsumerWidget {
  const ProfileAvatar({super.key});

  Future<void> _onTap(BuildContext context, WidgetRef ref) async {
    final avatarController = ref.read(avatarControllerProvider.notifier);
    final ScaffoldMessengerState messenger = ScaffoldMessenger.of(context);
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      final bytes = await image.readAsBytes();
      await avatarController.saveAvatar(bytes);
      messenger.showSnackBar(
        const SnackBar(
          content: Text('Avatar updated'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final avatarAsyncValue = ref.watch(avatarControllerProvider);
    return GestureDetector(
      onTap: () {
        _onTap(context, ref);
      },
      child: CircleAvatar(
        radius: 75,
        backgroundImage: switch (avatarAsyncValue) {
          AsyncData(:final value) => value,
          _ => null,
        },
        child: switch (avatarAsyncValue) {
          AsyncLoading() => const CircularProgressIndicator(),
          AsyncError() => const Icon(Icons.error),
          _ => null,
        },
      ),
    );
  }
}
