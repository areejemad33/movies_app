import 'package:injectable/injectable.dart';
import 'package:movies_app/features/Home/domain/entities/movie_entity.dart';
import 'package:movies_app/features/Home/domain/repositiries/home_repositery.dart';



@injectable
class GetMoviesByGenreUseCase {
  final HomeRepository repository;

  GetMoviesByGenreUseCase(this.repository);

  Future<List<MovieEntity>> call(String genre, int page) {
  return repository.getMoviesByGenre(genre, page: page);
}
  
}

