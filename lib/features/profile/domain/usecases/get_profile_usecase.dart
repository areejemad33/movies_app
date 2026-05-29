import 'package:injectable/injectable.dart';
import 'package:movies_app/features/profile/domain/repositeries/profile_repositery.dart';

import '../entities/profile_entity.dart';

@injectable
class GetProfileUseCase {

  final ProfileRepository repository;

  GetProfileUseCase(this.repository);

  Future<ProfileEntity> call() {
    return repository.getUserData();
  }
}