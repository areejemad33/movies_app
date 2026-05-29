import 'package:movies_app/features/profile/domain/entities/profile_entity.dart';
import 'package:movies_app/features/profile/domain/entities/update_profile_entity.dart';

abstract class ProfileRepository {
  Future<ProfileEntity> getUserData();

  Future<void> updateProfile(UpdateProfileEntity user);

  Future<void> deleteAccount();
  

  Future<void> signOut();
}