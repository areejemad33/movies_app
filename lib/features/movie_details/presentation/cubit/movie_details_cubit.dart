import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/features/movie_details/domain/use_cases/get_similar_movies_usecase.dart';
import 'package:movies_app/features/movie_details/domain/use_cases/movie_details_usecase.dart';

import 'movie_details_state.dart';

@injectable
class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetSimilarMoviesUseCase getSimilarMoviesUseCase;

  MovieDetailsCubit(this.getMovieDetailsUseCase, this.getSimilarMoviesUseCase)
    : super(const MovieDetailsState() );

  Future<void> getMovieDetails(int movieId) async {
    emit(state.copyWith(isLoading: true));

    try {
      final movie = await getMovieDetailsUseCase(movieId);

      emit(state.copyWith(movie: movie, isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  Future<void> getSimilarMovies(int movieId) async {
  try {
    final movies = await getSimilarMoviesUseCase.call(movieId);

    emit(state.copyWith(
      similarMovies: movies,
    ));
  } catch (e) {
    emit(state.copyWith(isLoading: false, error: e.toString()));
  }
}
}
