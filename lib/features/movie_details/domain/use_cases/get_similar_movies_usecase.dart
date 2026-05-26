import 'package:injectable/injectable.dart';
import 'package:movies_app/features/movie_details/domain/repositiries/movie_details_repositery.dart';
import '../entities/movie_details_entity.dart';

@injectable
class GetSimilarMoviesUseCase {
  final MovieDetailsRepositery repository; 

  GetSimilarMoviesUseCase(this.repository);

  Future<List<MovieDetailsEntity>> call(int movieId) {
    return repository.getSimilarMovies(movieId);
  }
}