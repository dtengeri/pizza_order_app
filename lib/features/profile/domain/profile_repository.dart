import 'package:pizza_order_app/features/profile/domain/user_profile.dart';

abstract class ProfileRepository {
  Future<UserProfile> getProfile();
  Future<UserProfile> create(UserProfile profile);
  Future<UserProfile> updateProfile(UserProfile profile);
}
