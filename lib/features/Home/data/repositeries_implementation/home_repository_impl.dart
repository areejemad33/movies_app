import 'package:injectable/injectable.dart';
import 'package:movies_app/features/Home/data/data_sources/home_remote_data_source.dart';
import 'package:movies_app/features/Home/domain/repositiries/home_repositery.dart';

import '../../domain/entities/movie_entity.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;

  HomeRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<MovieEntity>> getLatestMovies() {
    return remoteDataSource.getLatestMovies();
  }

  @override
  Future<List<MovieEntity>> getMoviesByGenre(String genre) {
    return remoteDataSource.getMoviesByGenre(genre);
  }
}
