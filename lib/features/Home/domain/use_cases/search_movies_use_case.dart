import 'package:injectable/injectable.dart';
import 'package:movies_app/features/Home/domain/entities/movie_entity.dart';
import 'package:movies_app/features/Home/domain/repositiries/search_repository.dart';


@injectable
class SearchMoviesUseCase {
  final SearchRepository repository;

  SearchMoviesUseCase(this.repository);

Future<List<MovieEntity>> call(
  String query,
  int page,
) async {
  return await repository.searchMovies(
    query,
    page,
  );
}
}