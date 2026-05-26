
import 'package:movies_app/features/movie_details/domain/entities/movie_details_entity.dart';

abstract class MovieDetailsRepositery {
  Future<MovieDetailsEntity> getMovieDetails(int movieId);
  Future<List<MovieDetailsEntity>> getSimilarMovies(int movieId);
}
