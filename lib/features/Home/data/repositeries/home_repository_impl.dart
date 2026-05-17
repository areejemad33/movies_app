import 'package:movies_app/features/Home/data/home_remote_data_source.dart';
import 'package:movies_app/features/Home/domain/repositiries/home_repositery.dart';

import '../../domain/entities/movie_entity.dart';

class HomeRepositoryImpl implements HomeRepository {

  final HomeRemoteDataSource remoteDataSource;

  HomeRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<MovieEntity>> getLatestMovies() {
    return remoteDataSource.getLatestMovies();
  }
}