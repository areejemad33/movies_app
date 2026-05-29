import 'package:injectable/injectable.dart';
import 'package:movies_app/features/profile/domain/repositeries/profile_repositery.dart';


@injectable
class SignOutUseCase {

  final ProfileRepository repository;

  SignOutUseCase(this.repository);

  Future<void> call() {
    return repository.signOut();
  }
}