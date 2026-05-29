import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'sign_in_with_google_states.dart';
@injectable
class GoogleAuthCubit extends Cubit<GoogleAuthState> {
  GoogleAuthCubit() : super(GoogleAuthInitial());

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> signInWithGoogle() async {
    try {
      emit(GoogleAuthLoading());

      final GoogleSignInAccount googleUser =
      await GoogleSignIn.instance.authenticate(
        scopeHint: ['email'],
      );

      final googleAuth = googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
      await _auth.signInWithCredential(credential);

      final doc = await _firestore
          .collection('users')
          .doc(userCredential.user!.uid)
          .get();

      if (!doc.exists) {
        await _auth.signOut();
        await GoogleSignIn.instance.signOut();
        emit(GoogleAuthError('Account not found. Please register first.'));
        return;
      }

      emit(GoogleAuthSuccess());

    } on GoogleSignInException catch (e) {
      print('Google Sign In Error: ${e.code} - ${e.description}');
      emit(GoogleAuthError('Something went wrong'));
    } catch (e) {
      print('Error: $e');
      emit(GoogleAuthError('Something went wrong'));
    }
  }
}