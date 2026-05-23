import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_states.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      emit(LoginLoading());

      await _auth.signInWithEmailAndPassword(
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