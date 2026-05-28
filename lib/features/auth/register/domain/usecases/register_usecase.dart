import 'package:injectable/injectable.dart';
import 'package:movies_app/features/auth/register/domain/repositeries/auth_repositery.dart';

import '../entities/register_entity.dart';
@lazySingleton
class RegisterUseCase {
  final AuthRepository repository;

  RegisterUseCase(this.repository);

  Future<void> call({
    required RegisterEntity entity,
    required String password,
  }) {
    return repository.register(
      entity: entity,
      password: password,
    );
  }
}