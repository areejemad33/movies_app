import 'package:movies_app/features/Home/domain/entities/movie_entity.dart';

abstract class SearchRepository {
  Future<List<MovieEntity>> searchMovies(
    String query,
    int page,
  );
}