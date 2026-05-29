
import 'package:injectable/injectable.dart';
import 'package:movies_app/features/auth/domain/repositeries/auth_repositery.dart';
@lazySingleton
class LoginUseCase {

  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<void> call({
    required String email,
    required String password,
  }) {
    return repository.login(
      email: email,
      password: password,
    );
  }
}