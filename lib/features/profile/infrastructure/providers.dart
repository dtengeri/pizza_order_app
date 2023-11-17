import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pizza_order_app/features/profile/domain/address_resolver.dart';
import 'package:pizza_order_app/features/profile/domain/avatar_repository.dart';
import 'package:pizza_order_app/features/profile/domain/profile_repository.dart';
import 'package:pizza_order_app/features/profile/infrastructure/file_system_avatar_repository.dart';
import 'package:pizza_order_app/features/profile/infrastructure/firebase_profile_repository.dart';
import 'package:pizza_order_app/features/profile/infrastructure/nominatim_address_resolver.dart';

final profileRepositoryProvider = Provider<ProfileRepository>((ref) {
  return FirebaseProfileRepository();
});

final addressResolverProvider = Provider<AddressResolver>((ref) {
  return NominatimAddressResolver(
    dio: ref.watch(dioProvider),
  );
});

final dioProvider = Provider<Dio>((ref) {
  return Dio();
});

final avatarRepositoryProvider = Provider<AvatarRepository>((ref) {
  return FileSystemAvatarRepository();
});
