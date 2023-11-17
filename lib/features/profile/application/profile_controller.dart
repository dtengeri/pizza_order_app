import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pizza_order_app/features/auth/application/auth_controller.dart';
import 'package:pizza_order_app/features/auth/domain/auth_state.dart';
import 'package:pizza_order_app/features/profile/domain/delivery_address.dart';
import 'package:pizza_order_app/features/profile/domain/user_profile.dart';
import 'package:pizza_order_app/features/profile/infrastructure/providers.dart';

class ProfileController extends AsyncNotifier<UserProfile> {
  @override
  Future<UserProfile> build() async {
    final profileRepository = ref.watch(profileRepositoryProvider);
    final user = ref.watch(authControllerProvider);
    return switch (user) {
      Unknown() ||
      Unauthenticated() =>
        const UserProfile(uid: '', phone: '', addresses: []),
      Authenticated(:final user) =>
        await profileRepository.getProfile(user.uid),
    };
  }

  Future<void> updateProfile(UserProfile profile) async {
    final profileRepository = ref.watch(profileRepositoryProvider);
    state = await AsyncValue.guard(() {
      return profileRepository.updateProfile(profile);
    });
  }

  Future<void> addDeliveryAddress(DeliveryAddress address) async {
    switch (state) {
      case AsyncData(:final value):
        final coordinates = await ref.read(addressResolverProvider).resolve(
              city: address.city,
              street: address.street,
              houseNumber: address.houseNumber,
            );
        final updatedProfile = value.copyWith(
          addresses: [
            ...value.addresses,
            address.copyWith(coordinates: coordinates),
          ],
        );
        return updateProfile(updatedProfile);

      default:
        throw StateError('Can not add address to $state');
    }
  }
}

final profileControllerProvider =
    AsyncNotifierProvider<ProfileController, UserProfile>(
  () => ProfileController(),
);
