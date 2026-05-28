import 'package:injectable/injectable.dart';
import 'package:movies_app/features/profile/domain/repositeries/profile_repositery.dart';
@lazySingleton 
class DeleteAccountUseCase {
  final ProfileRepository repository;

  DeleteAccountUseCase(this.repository);

  Future<void> call() {
    return repository.deleteAccount();
  }
}