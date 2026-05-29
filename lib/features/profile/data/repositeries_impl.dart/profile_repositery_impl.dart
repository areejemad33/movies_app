import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/features/profile/data/data_sources/profile_remote_data_source.dart';
import 'package:movies_app/features/profile/domain/entities/profile_entity.dart';
import 'package:movies_app/features/profile/domain/entities/update_profile_entity.dart';
import 'package:movies_app/features/profile/domain/repositeries/profile_repositery.dart';

@LazySingleton(as: ProfileRepository)
class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource remote;

  ProfileRepositoryImpl(this.remote);

  @override

Future<ProfileEntity> getUserData() async {

  final data = await remote.getUserData();

  return ProfileEntity(
    name: data['name'] ?? '',
    phone: data['phone'] ?? '',
    avatarId: data['avatarId'] ?? '0',
    watchListCount:
        data['watchListCount'] ?? 0,
    historyCount:
        data['historyCount'] ?? 0,
  );
}
  @override
  Future<void> updateProfile(UpdateProfileEntity user) {
    return remote.updateProfile({
      'name': user.name,
      'phone': user.phone,
      'avatarId': user.avatarId,
    });
  }

@override
Future<void> deleteAccount() async {
  try {
    final user = FirebaseAuth.instance.currentUser;

    await FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .delete();

    await user.delete();

  } on FirebaseAuthException catch (e) {

    if (e.code == 'requires-recent-login') {

      await FirebaseAuth.instance.signOut();

      throw Exception(
        'Session expired, please login again',
      );
    }

    throw Exception(
      e.message ?? 'Failed to delete account',
    );
  }
}


  @override
  Future<void> signOut() {
    return remote.signOut();
  }
}
