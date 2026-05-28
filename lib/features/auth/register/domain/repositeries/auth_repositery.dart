import '../entities/register_entity.dart';

abstract class AuthRepository {
  Future<void> register({
    required RegisterEntity entity,
    required String password,
  });
}