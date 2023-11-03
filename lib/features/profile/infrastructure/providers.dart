import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pizza_order_app/features/profile/domain/profile_repository.dart';
import 'package:pizza_order_app/features/profile/infrastructure/dummy_profile_repository.dart';

final profileRepositoryProvider = Provider<ProfileRepository>((ref) {
  return DummyProfileRepository();
});
