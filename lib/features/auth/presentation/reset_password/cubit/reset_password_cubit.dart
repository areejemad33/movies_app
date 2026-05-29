import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/features/auth/domain/usecases/reset_password_use_case.dart';
import 'package:movies_app/features/auth/presentation/reset_password/cubit/reset_password_states.dart';

@injectable
class ResetPasswordCubit
    extends Cubit<ResetPasswordState> {

  final ResetPasswordUseCase resetPasswordUseCase;

  ResetPasswordCubit(
    this.resetPasswordUseCase,
  ) : super(ResetPasswordInitial());

  Future<void> resetPassword({
    required String email,
  }) async {

    try {

      emit(ResetPasswordLoading());

      await resetPasswordUseCase(email);

      emit(ResetPasswordSuccess());

    } on FirebaseAuthException catch (e) {

      switch (e.code) {

        case 'user-not-found':
          emit(
            ResetPasswordError(
              'No account found with this email',
            ),
          );
          break;

        case 'invalid-email':
          emit(
            ResetPasswordError(
              'Invalid email address',
            ),
          );
          break;

        default:
          emit(
            ResetPasswordError(
              e.message ?? 'Something went wrong',
            ),
          );
      }

    } catch (e) {

      emit(
        ResetPasswordError(
          'Something went wrong',
        ),
      );
    }
  }
}