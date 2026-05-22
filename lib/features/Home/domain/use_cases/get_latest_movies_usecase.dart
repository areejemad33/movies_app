import 'package:injectable/injectable.dart';
import 'package:movies_app/features/Home/domain/repositiries/home_repositery.dart';
import '../entities/movie_entity.dart';

@injectable
class GetLatestMoviesUseCase {
  final HomeRepository repository;

  GetLatestMoviesUseCase(this.repository);

  Future<List<MovieEntity>> call() {
    return repository.getLatestMovies();
  }
}