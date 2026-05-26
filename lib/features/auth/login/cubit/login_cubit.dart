import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_states.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      emit(LoginLoading());

      final UserCredential userCredential =
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final doc = await _firestore
          .collection('users')
          .doc(userCredential.user!.uid)
          .get();

      if (!doc.exists) {
        await _auth.signOut();
        emit(LoginError('Account not found. Please register first.'));
        return;
      }

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