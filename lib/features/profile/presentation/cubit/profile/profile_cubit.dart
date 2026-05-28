import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/profile/presentation/cubit/profile/profile_states.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> getProfile() async {
    try {
      emit(ProfileLoading());

      final doc = await _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .get();

      final data = doc.data()!;

      emit(ProfileSuccess(
        name: data['name'] ?? '',
        avatarId: data['avatarId'] ?? '0',
        watchListCount: data['watchListCount'] ?? 0,
        historyCount: data['historyCount'] ?? 0,
      ));

    } catch (e) {
      emit(ProfileError('Something went wrong'));
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}