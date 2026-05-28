import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/features/auth/register/data/data_sources/auth_remote_datasource.dart';
import 'package:movies_app/features/auth/register/data/models/register_model.dart';
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
}