import '../entities/register_entity.dart';

abstract class AuthRepository {
  Future<void> register({
    required RegisterEntity entity,
    required String password,
  });

    Future<void> login({
    required String email,
    required String password,
  });


  Future<void> resetPassword(String email);
}