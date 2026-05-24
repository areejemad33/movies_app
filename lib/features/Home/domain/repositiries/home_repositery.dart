

import '../entities/movie_entity.dart';
abstract class HomeRepository {
  Future<List<MovieEntity>> getLatestMovies();

Future<List<MovieEntity>> getMoviesByGenre(
  String genre, {
  int page = 1,
});
}
