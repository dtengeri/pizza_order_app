import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pizza_order_app/features/login/domain/login_repository.dart';
import 'package:pizza_order_app/features/login/infrastructure/dummy_login_repository.dart';

final loginRepositoryProvider = Provider<LoginRepository>(
  (ref) => DummyLoginRepository(),
);
