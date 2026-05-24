import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/features/Home/domain/entities/movie_entity.dart';

import '../../../domain/use_cases/search_movies_use_case.dart';
import 'search_state.dart';

@injectable
class SearchCubit extends Cubit<SearchState> {
  final SearchMoviesUseCase searchMoviesUseCase;

  SearchCubit(this.searchMoviesUseCase)
      : super(SearchInitial());

  final TextEditingController searchController =
      TextEditingController();

  List<MovieEntity> movies = [];

  int currentPage = 1;

  bool hasMore = true;

  bool isLoading = false;

  String currentQuery = '';

  Future<void> searchMovies(String query) async {
    if (query.trim().isEmpty) {
      movies.clear();

      emit(SearchInitial());

      return;
    }

    try {
      currentQuery = query;

      currentPage = 1;

      hasMore = true;

      emit(SearchLoading());

      final result = await searchMoviesUseCase(
        query,
        currentPage,
      );

      movies = result;

      emit(SearchSuccess());

    } catch (e) {
      emit(
        SearchError(
          e.toString(),
        ),
      );
    }
  }

  Future<void> loadMoreMovies() async {
    if (isLoading ||
        !hasMore ||
        currentQuery.isEmpty) {
      return;
    }

    try {
      isLoading = true;

      emit(SearchPaginationLoading());

      currentPage++;

      final result = await searchMoviesUseCase(
        currentQuery,
        currentPage,
      );

      if (result.isEmpty) {
        hasMore = false;
      } else {
        movies.addAll(result);
      }

      emit(SearchSuccess());

    } catch (e) {
      emit(
        SearchError(
          e.toString(),
        ),
      );
    }

    isLoading = false;
  }

  @override
  Future<void> close() {
    searchController.dispose();

    return super.close();
  }
}