

import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_state.dart';

import '../../domain/use_cases/get_latest_movies_usecase.dart';

class HomeCubit extends Cubit<HomeStates> {
  final GetLatestMoviesUseCase getLatestMoviesUseCase;

  HomeCubit(this.getLatestMoviesUseCase)
      : super(HomeLoading());

  Future<void> getLatestMovies() async {
    try {
      final movies = await getLatestMoviesUseCase();

      emit(HomeSuccess(
        movies: movies,
        currentIndex: 0,
      ));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }

  void changeIndex(int index) {
    final currentState = state;

    if (currentState is HomeSuccess) {
      emit(HomeSuccess(
        movies: currentState.movies,
        currentIndex: index,
      ));
    }
  }
}