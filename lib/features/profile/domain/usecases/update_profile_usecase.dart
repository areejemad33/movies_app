import 'package:injectable/injectable.dart';
import 'package:movies_app/features/profile/domain/entities/user_entity.dart';
import 'package:movies_app/features/profile/domain/repositeries/profile_repositery.dart';
@lazySingleton 
class UpdateProfileUseCase {
  final ProfileRepository repository;

  UpdateProfileUseCase(this.repository);

  Future<void> call(UserEntity user) {
    return repository.updateProfile(user);
  }
}