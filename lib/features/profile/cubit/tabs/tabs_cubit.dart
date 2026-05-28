import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/profile/cubit/tabs/tabs_states.dart';
import '../../../Home/data/models/movie_model.dart';

class TabsCubit extends Cubit<TabsState> {
  TabsCubit() : super(TabsInitial());

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  Future<void> getWatchList() async {
    try {
      emit(TabsLoading());
      final snapshot = await _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .collection('watchList')
          .get();
      emit(TabsSuccess(snapshot.docs.map((doc) => doc.data()).toList()));
    } catch (e) {
      emit(TabsError('Something went wrong'));
    }
  }

  Future<void> addToWatchList(MovieModel movie) async {
    try {
      await _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .collection('watchList')
          .doc(movie.id.toString())
          .set(movie.toJson());

      await _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .update({'watchListCount': FieldValue.increment(1)});

      await getWatchList();
    } catch (e) {
      emit(TabsError('Something went wrong'));
    }
  }

  Future<void> removeFromWatchList(int movieId) async {
    try {
      await _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .collection('watchList')
          .doc(movieId.toString())
          .delete();

      await _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .update({'watchListCount': FieldValue.increment(-1)});

      await getWatchList();
    } catch (e) {
      emit(TabsError('Something went wrong'));
    }
  }


  Future<void> getHistory() async {
    try {
      emit(TabsLoading());
      final snapshot = await _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .collection('history')
          .get();
      emit(TabsSuccess(snapshot.docs.map((doc) => doc.data()).toList()));
    } catch (e) {
      emit(TabsError('Something went wrong'));
    }
  }

  Future<void> addToHistory(MovieModel movie) async {
    try {
      await _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .collection('history')
          .doc(movie.id.toString())
          .set(movie.toJson());

      await _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .update({'historyCount': FieldValue.increment(1)});

      await getHistory();
    } catch (e) {
      emit(TabsError('Something went wrong'));
    }
  }
}