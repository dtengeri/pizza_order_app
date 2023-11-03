import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pizza_order_app/features/auth/domain/auth_state.dart';
import 'package:pizza_order_app/features/auth/infrastructure/providers.dart';

class AuthController extends Notifier<AuthState> {
  StreamSubscription<AuthState>? _authStateChangesSubscription;

  @override
  AuthState build() {
    ref.onDispose(() {
      _authStateChangesSubscription?.cancel();
    });
    _authStateChangesSubscription?.cancel();
    _authStateChangesSubscription = ref
        .watch(authRepositoryProvider)
        .watch()
        .listen((authState) => state = authState);

    return const Unknown();
  }

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await ref.read(authRepositoryProvider).signInWithEmailAndPassword(
          email: email,
          password: password,
        );
  }

  Future<void> signOut() async {
    await ref.read(authRepositoryProvider).signOut();
  }
}

final authControllerProvider = NotifierProvider<AuthController, AuthState>(
  () => AuthController(),
);
