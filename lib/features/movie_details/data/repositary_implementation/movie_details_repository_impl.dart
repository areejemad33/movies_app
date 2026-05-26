// import 'package:injectable/injectable.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/features/movie_details/data/movie_details_remote_data_source.dart';
import 'package:movies_app/features/movie_details/domain/entities/movie_details_entity.dart';
import 'package:movies_app/features/movie_details/domain/repositiries/movie_details_repositery.dart';


@Injectable(as: MovieDetailsRepositery)
class MovieDetailsRepositoryImpl implements MovieDetailsRepositery {
  final MovieDetailsRemoteDataSource remoteDataSource;

  MovieDetailsRepositoryImpl(this.remoteDataSource);

  @override
  Future<MovieDetailsEntity> getMovieDetails(int movieId) {
    return remoteDataSource.getMovieDetails(movieId);
  }

  @override
Future<List<MovieDetailsEntity>> getSimilarMovies(int movieId) {
  return remoteDataSource.getSimilarMovies(movieId);
}
}
