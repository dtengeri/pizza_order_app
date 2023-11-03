import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pizza_order_app/features/profile/domain/user_profile.dart';
import 'package:pizza_order_app/features/profile/infrastructure/providers.dart';

class ProfileController extends AsyncNotifier<UserProfile> {
  @override
  Future<UserProfile> build() {
    final profileRepository = ref.watch(profileRepositoryProvider);
    return profileRepository.getProfile();
  }

  Future<void> updateProfile(UserProfile profile) async {
    final profileRepository = ref.watch(profileRepositoryProvider);
    state = await AsyncValue.guard(() {
      return profileRepository.updateProfile(profile);
    });
  }
}

final profileControllerProvider =
    AsyncNotifierProvider<ProfileController, UserProfile>(
  () => ProfileController(),
);
