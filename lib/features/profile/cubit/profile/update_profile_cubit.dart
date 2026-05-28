import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/profile/cubit/profile/update_profile_states.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  UpdateProfileCubit() : super(UpdateProfileInitial());

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Map<String, dynamic>?> getUserData() async {
    try {
      final doc = await _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .get();
      return doc.data();
    } catch (e) {
      return null;
    }
  }

  Future<void> updateProfile({
    required String name,
    required String phone,
    required String avatarId,
  }) async {
    try {
      emit(UpdateProfileLoading());

      await _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .update({
        'name': name,
        'phone': phone,
        'avatarId': avatarId,
      });

      await _auth.currentUser?.updateDisplayName(name);

      emit(UpdateProfileSuccess());

    } catch (e) {
      emit(UpdateProfileError('Something went wrong'));
    }
  }

  Future<void> deleteAccount() async {
    try {
      emit(DeleteAccountLoading());

      await _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .delete();

      await _auth.currentUser?.delete();

      emit(DeleteAccountSuccess());

    } catch (e) {
      emit(UpdateProfileError('Something went wrong'));
    }
  }
}