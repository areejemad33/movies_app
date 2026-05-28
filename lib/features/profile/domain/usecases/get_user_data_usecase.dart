import 'package:injectable/injectable.dart';
import 'package:movies_app/features/profile/domain/entities/user_entity.dart';
import 'package:movies_app/features/profile/domain/repositeries/profile_repositery.dart';
@lazySingleton 
class GetUserDataUseCase {
  final ProfileRepository repository;

  GetUserDataUseCase(this.repository);

  Future<UserEntity> call() {
    return repository.getUserData();
  }
}