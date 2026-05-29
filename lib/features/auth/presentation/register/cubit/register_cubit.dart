import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/entities/register_entity.dart';
import '../../../domain/usecases/register_usecase.dart';
import 'register_states.dart';
@injectable
class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUseCase registerUseCase;

  RegisterCubit(this.registerUseCase) : super(RegisterInitial());

  Future<void> register({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
    required String phone,
    required String avatarId,
  }) async {
    emit(RegisterLoading());

    try {
      final entity = RegisterEntity(
        name: name,
        email: email,
        phone: phone,
        avatarId: avatarId,
      );

      await registerUseCase(
        entity: entity,
        password: password,
      );

      emit(RegisterSuccess());
    } catch (e) {
      emit(RegisterError(e.toString()));
    }
  }
}