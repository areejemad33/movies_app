import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/features/Home/domain/use_cases/get_random_movies_use_case.dart';

import 'browse_state.dart';
@injectable
class BrowseCubit extends Cubit<BrowseState> {

  final GetMoviesByGenreUseCase getMoviesByGenreUseCase;

  BrowseCubit(this.getMoviesByGenreUseCase)
      : super(BrowseInitial());

String selectedCategory = "Action";
  Future<void> getMoviesByGenre(String genre) async {

    selectedCategory = genre;

    emit(BrowseLoading());

    try {

      final movies =
          await getMoviesByGenreUseCase(genre);

      emit(BrowseLoaded(movies));

    } catch (e) {

      emit(BrowseError(e.toString()));
    }
  }
}