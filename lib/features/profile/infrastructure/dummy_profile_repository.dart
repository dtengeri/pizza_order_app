import 'package:pizza_order_app/features/profile/domain/delivery_address.dart';
import 'package:pizza_order_app/features/profile/domain/profile_repository.dart';
import 'package:pizza_order_app/features/profile/domain/user_profile.dart';

class DummyProfileRepository extends ProfileRepository {
  @override
  Future<UserProfile> getProfile(String uid) async {
    return const UserProfile(
      uid: '1',
      phone: '+36301234567',
      addresses: [
        DeliveryAddress(
          city: 'Szeged',
          street: 'Kossuth Lajos sgt.',
          houseNumber: '84',
        ),
      ],
    );
  }

  @override
  Future<UserProfile> create(String uid) async {
    return UserProfile(uid: uid, phone: '', addresses: []);
  }

  @override
  Future<UserProfile> updateProfile(UserProfile profile) async {
    return profile;
  }
}
