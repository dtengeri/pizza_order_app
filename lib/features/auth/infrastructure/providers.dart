import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pizza_order_app/features/auth/domain/auth_repository.dart';
import 'package:pizza_order_app/features/auth/infrastructure/firebase_auth_repository.dart';

final authRepositoryProvider = Provider<AuthRepository>(
  (ref) => FirebaseAuthRepository(),
);
