import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pizza_order_app/features/profile/domain/delivery_address.dart';

part 'user_profile.freezed.dart';
part 'user_profile.g.dart';

@freezed
class UserProfile with _$UserProfile {
  const factory UserProfile({
    required String uid,
    required String? phone,
    required List<DeliveryAddress> addresses,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);
}
