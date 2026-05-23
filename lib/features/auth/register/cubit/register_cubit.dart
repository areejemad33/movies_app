import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/auth/register/cubit/register_states.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void>  register({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
    required String phone,
    required String avatar,
  }) async {
    try {
      emit(RegisterLoading());

      final UserCredential userCredential =
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await _firestore
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({
        'uid': userCredential.user!.uid,
        'name': name,
        'email': email,
        'phone': phone,
        'avatar': avatar,
        'createdAt': FieldValue.serverTimestamp(),
      });

      await userCredential.user?.updateDisplayName(name);

      emit(RegisterSuccess());
    } on FirebaseAuthException catch (e) {
      print('Firebase Error Code: ${e.code}');
      switch (e.code) {
        case 'email-already-in-use':
          emit(RegisterError('Email already in use'),
          );
          break;
        case 'invalid-email':
          emit(RegisterError('Invalid email address'));
          break;
        case 'weak-password':
          emit(RegisterError('Password is too weak'));
          break;
        default:
          emit(RegisterError(e.message ?? 'Something went wrong'));
      }
    } catch (e) {
      emit(RegisterError('Something went wrong'));
    }
  }}