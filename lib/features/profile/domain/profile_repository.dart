import 'package:pizza_order_app/features/profile/domain/user_profile.dart';

abstract class ProfileRepository {
  Future<UserProfile> getProfile(String uid);
  Future<UserProfile> create(String uid);
  Future<UserProfile> updateProfile(UserProfile profile);
}
