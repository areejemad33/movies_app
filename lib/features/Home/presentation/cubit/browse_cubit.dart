import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/features/Home/domain/entities/movie_entity.dart';
import 'package:movies_app/features/Home/domain/use_cases/get_random_movies_use_case.dart';

import 'browse_state.dart';

@injectable
class BrowseCubit extends Cubit<BrowseState> {
  final GetMoviesByGenreUseCase getMoviesByGenreUseCase;

  BrowseCubit(this.getMoviesByGenreUseCase) : super(BrowseInitial());

  String selectedCategory = "Action";

  int _page = 1;
  bool _isLoadingMore = false;
  List<MovieEntity> _movies = [];

  Future<void> getMoviesByGenre(String genre) async {
    selectedCategory = genre;
    _page = 1;
    _movies = [];

    emit(BrowseLoading());

    try {
      final movies = await getMoviesByGenreUseCase(genre, _page);

      _movies = movies;

      emit(BrowseLoaded(List.from(_movies)));
    } catch (e) {
      emit(BrowseError(e.toString()));
    }
  }

  Future<void> loadMore() async {
    if (_isLoadingMore) return;

    _isLoadingMore = true;

    final currentState = state;

    if (currentState is BrowseLoaded) {
      emit(BrowseLoaded(currentState.movies, isLoadingMore: true));
    }

    _page++;

    try {
      final moreMovies = await getMoviesByGenreUseCase(selectedCategory, _page);

      _movies.addAll(moreMovies);

      emit(BrowseLoaded(List.from(_movies), isLoadingMore: false));
    } catch (e) {
      emit(BrowseError(e.toString()));
    }

    _isLoadingMore = false;
  }
}
