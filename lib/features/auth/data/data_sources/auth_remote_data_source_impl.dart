import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:movies_app/features/auth/data/models/register_model.dart';

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;

  AuthRemoteDataSourceImpl({
    required this.firebaseAuth,
    required this.firestore,
  });

  @override
  Future<void> register({
    required RegisterModel model,
    required String password,
  }) async {
    final userCredential =
        await firebaseAuth.createUserWithEmailAndPassword(
      email: model.email,
      password: password,
    );

    final uid = userCredential.user!.uid;

    await firestore
        .collection('users')
        .doc(uid)
        .set(model.toMap(uid));

    await userCredential.user?.updateDisplayName(model.name);
  }


  @override
Future<void> login({
  required String email,
  required String password,
}) async {

  final userCredential =
      await firebaseAuth.signInWithEmailAndPassword(
    email: email,
    password: password,
  );

  final doc = await firestore
      .collection('users')
      .doc(userCredential.user!.uid)
      .get();

  if (!doc.exists) {
    await firebaseAuth.signOut();
    throw FirebaseAuthException(
      code: 'user-not-found',
      message: 'Account not found',
    );
  }
}

  @override
  Future<void> resetPassword(String email) async {

    final query = await firestore
        .collection('users')
        .where('email', isEqualTo: email)
        .get();

    if (query.docs.isEmpty) {
      throw FirebaseAuthException(
        code: 'user-not-found',
      );
    }

    await firebaseAuth.sendPasswordResetEmail(
      email: email,
    );
  }
}