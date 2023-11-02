import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:pizza_order_app/features/auth/domain/auth_repository.dart';
import 'package:pizza_order_app/features/auth/domain/auth_state.dart';
import 'package:pizza_order_app/features/core/domain/user.dart' as core;

class FirebaseAuthRepository extends AuthRepository {
  @override
  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Stream<AuthState> watch() {
    return FirebaseAuth.instance.userChanges().map((user) {
      if (user == null) {
        return const Unauthenticated();
      } else {
        return Authenticated(
          user: core.User(
            name: user.displayName ?? 'Unknown',
            email: user.email ?? 'Unknown',
          ),
        );
      }
    });
  }

  @override
  Future<void> signOut() {
    return FirebaseAuth.instance.signOut();
  }
}
