import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pizza_order_app/features/profile/domain/profile_repository.dart';
import 'package:pizza_order_app/features/profile/domain/user_profile.dart';

const _userProfileCollection = 'user_profiles';

class FirebaseProfileRepository extends ProfileRepository {
  final _db = FirebaseFirestore.instance;

  @override
  Future<UserProfile> create(String uid) async {
    final profile = UserProfile(uid: uid, phone: '', addresses: []);
    await _db
        .collection(_userProfileCollection)
        .withConverter(
            fromFirestore: _userProfileFromFirestore,
            toFirestore: _userProfileToFirestore)
        .doc(uid)
        .set(profile);
    return profile;
  }

  @override
  Future<UserProfile> getProfile(String uid) async {
    final snapshot = await _db
        .collection(_userProfileCollection)
        .withConverter(
            fromFirestore: _userProfileFromFirestore,
            toFirestore: _userProfileToFirestore)
        .doc(uid)
        .get();
    final profile = snapshot.data();
    if (profile == null) {
      return create(uid);
    }
    return profile;
  }

  @override
  Future<UserProfile> updateProfile(UserProfile profile) async {
    await _db
        .collection(_userProfileCollection)
        .withConverter(
            fromFirestore: _userProfileFromFirestore,
            toFirestore: _userProfileToFirestore)
        .doc(profile.uid)
        .set(profile);
    return profile;
  }
}

UserProfile _userProfileFromFirestore(
  DocumentSnapshot<Map<String, dynamic>> snapshot,
  SnapshotOptions? options,
) =>
    UserProfile.fromJson(snapshot.data() ?? {});

Map<String, dynamic> _userProfileToFirestore(
        UserProfile profile, SetOptions? options) =>
    profile.toJson();
