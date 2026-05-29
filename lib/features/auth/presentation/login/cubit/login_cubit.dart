import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/features/auth/domain/usecases/login_use_case.dart';

import 'login_states.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {

  final LoginUseCase loginUseCase;

  LoginCubit(this.loginUseCase)
      : super(LoginInitial());

  Future<void> login({
    required String email,
    required String password,
  }) async {

    try {

      emit(LoginLoading());

      await loginUseCase(
        email: email,
        password: password,
      );

      emit(LoginSuccess());

    } on FirebaseAuthException catch (e) {

      switch (e.code) {

        case 'user-not-found':
          emit(LoginError('No user found with this email'));
          break;

        case 'wrong-password':
          emit(LoginError('Wrong password'));
          break;

        case 'invalid-email':
          emit(LoginError('Invalid email address'));
          break;

        case 'invalid-credential':
          emit(LoginError('Invalid email or password'));
          break;

        case 'user-disabled':
          emit(LoginError('This account has been disabled'));
          break;

        default:
          emit(LoginError(e.message ?? 'Something went wrong'));
      }

    } catch (e) {

      emit(LoginError('Something went wrong'));

    }
  }
}