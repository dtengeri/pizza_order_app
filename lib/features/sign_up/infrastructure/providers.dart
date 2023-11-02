import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pizza_order_app/features/sign_up/domain/sign_up_repository.dart';
import 'package:pizza_order_app/features/sign_up/infrastructure/firebase_sign_up_repository.dart';

final signUpRepositoryProvider = Provider<SignUpRepository>(
  (ref) => FirebaseSignUpRepository(),
);
