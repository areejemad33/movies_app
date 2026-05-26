import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/auth/reset_password/cubit/reset_password_states.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit() : super(ResetPasswordInitial());

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> resetPassword({required String email}) async {
    try {
      emit(ResetPasswordLoading());

      final query = await _firestore
          .collection('users')
          .where('email', isEqualTo: email)
          .get();

      if (query.docs.isEmpty) {
        emit(ResetPasswordError('No account found with this email'));
        return;
      }

      await _auth.sendPasswordResetEmail(email: email);

      emit(ResetPasswordSuccess());

    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          emit(ResetPasswordError('No user found with this email'));
          break;
        case 'invalid-email':
          emit(ResetPasswordError('Invalid email address'));
          break;
        default:
          emit(ResetPasswordError(e.message ?? 'Something went wrong'));
      }
    } catch (e) {
      emit(ResetPasswordError('Something went wrong'));
    }
  }
}