import 'package:movies_app/features/Home/domain/repositiries/home_repositery.dart';

import '../entities/movie_entity.dart';

class GetLatestMoviesUseCase {

  final HomeRepository repository;

  GetLatestMoviesUseCase(this.repository);

  Future<List<MovieEntity>> call() {
    return repository.getLatestMovies();
  }
}