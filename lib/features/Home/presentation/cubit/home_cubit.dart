import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/constants/categories.dart';
import 'package:movies_app/features/Home/domain/use_cases/get_latest_movies_usecase.dart';
import 'home_state.dart';
import '../../domain/use_cases/get_random_movies_use_case.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final GetLatestMoviesUseCase getLatestMoviesUseCase;
  final GetMoviesByGenreUseCase getRandomMoviesUseCase;

  HomeCubit(this.getLatestMoviesUseCase, this.getRandomMoviesUseCase)
    : super(const HomeState());

    String getRandomGenre() {


  return categories[Random().nextInt(categories.length)];
}

  Future<void> loadHome() async {
    emit(state.copyWith(isLoading: true, error: null));

    try {
      final latestMovies = await getLatestMoviesUseCase();

      final randomGenre = getRandomGenre();

      final genreMovies = await getRandomMoviesUseCase(randomGenre);

      emit(
        state.copyWith(
          latestMovies: latestMovies,
          genreMovies: genreMovies,
          selectedGenre: randomGenre,
          currentIndex: 0,
          isLoading: false,
        ),
      );
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  void changeIndex(int index) {
    emit(state.copyWith(currentIndex: index));
  }

  Future<void> changeGenre(String genre) async {
    emit(state.copyWith(isLoading: true, selectedGenre: genre));

    try {
      final movies = await getRandomMoviesUseCase(genre);

      emit(state.copyWith(genreMovies: movies, isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }
void changeBottomNav(int index) async {

  emit(state.copyWith(
    bottomNavIndex: index,
  ));

  if (index == 0) {
    await changeGenre(getRandomGenre());
  }
}
}
