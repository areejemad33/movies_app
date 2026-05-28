import 'package:movies_app/features/profile/domain/entities/user_entity.dart';

abstract class ProfileRepository {
  Future<UserEntity> getUserData();

  Future<void> updateProfile(UserEntity user);

  Future<void> deleteAccount();
}