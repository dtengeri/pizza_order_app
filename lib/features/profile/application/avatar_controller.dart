import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pizza_order_app/features/profile/infrastructure/providers.dart';

class AvatarController extends AsyncNotifier<ImageProvider<Object>> {
  @override
  Future<ImageProvider<Object>> build() {
    return ref.watch(avatarRepositoryProvider).getAvatar();
  }

  Future<void> saveAvatar(Uint8List bytes) async {
    await ref.watch(avatarRepositoryProvider).saveAvatar(bytes);
    state = await AsyncValue.guard(
      () => ref.read(avatarRepositoryProvider).getAvatar(),
    );
  }
}

final avatarControllerProvider =
    AsyncNotifierProvider<AvatarController, ImageProvider<Object>>(
  () => AvatarController(),
);
