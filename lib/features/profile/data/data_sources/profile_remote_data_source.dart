import 'package:movies_app/features/profile/data/models/profile_model.dart';

abstract class ProfileRemoteDataSource {

  Future<Map<String, dynamic>> getUserData();

  Future<ProfileModel> getProfile();

  Future<void> updateProfile(
    Map<String, dynamic> data,
  );

  Future<void> signOut();

  Future<void> deleteAccount();
}