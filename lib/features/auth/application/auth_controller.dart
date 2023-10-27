import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pizza_order_app/features/auth/domain/auth_state.dart';
import 'package:pizza_order_app/features/core/domain/user.dart';

class AuthController extends Notifier<AuthState> {
  @override
  AuthState build() {
    return const Unauthenticated();
  }

  void signIn(User user) {
    state = Authenticated(user: user);
  }

  void signOut() {
    state = const Unauthenticated();
  }
}

final authControllerProvider = NotifierProvider<AuthController, AuthState>(
  () => AuthController(),
);
