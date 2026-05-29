import 'package:injectable/injectable.dart';
import 'package:movies_app/features/auth/domain/repositeries/auth_repositery.dart';


@injectable
class ResetPasswordUseCase {

  final AuthRepository repository;

  ResetPasswordUseCase(this.repository);

  Future<void> call(String email) {
    return repository.resetPassword(email);
  }
}