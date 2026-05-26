import 'package:injectable/injectable.dart';
import 'package:movies_app/features/movie_details/domain/repositiries/movie_details_repositery.dart';
import '../../domain/entities/movie_details_entity.dart';

@injectable
class GetMovieDetailsUseCase {
  final MovieDetailsRepositery repository;

  GetMovieDetailsUseCase(this.repository);

  Future<MovieDetailsEntity> call(int movieId) {
    return repository.getMovieDetails(movieId);
  }
}
