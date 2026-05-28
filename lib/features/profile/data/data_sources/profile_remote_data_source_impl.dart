import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/features/profile/data/data_sources/profile_remote_data_source.dart';
@LazySingleton(as: ProfileRemoteDataSource)
class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;

  ProfileRemoteDataSourceImpl(this.firestore, this.auth);

  @override
  Future<Map<String, dynamic>> getUserData() async {
    final uid = auth.currentUser!.uid;

    final doc = await firestore.collection('users').doc(uid).get();
    return doc.data()!;
  }

  @override
  Future<void> updateProfile(Map<String, dynamic> data) async {
    final uid = auth.currentUser!.uid;

    await firestore.collection('users').doc(uid).update(data);
  }

  @override
  Future<void> deleteAccount() async {
    final uid = auth.currentUser!.uid;

    await firestore.collection('users').doc(uid).delete();
    await auth.currentUser!.delete();
  }
}