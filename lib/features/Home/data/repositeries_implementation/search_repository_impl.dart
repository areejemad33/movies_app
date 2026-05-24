import 'package:injectable/injectable.dart';
import 'package:movies_app/features/Home/domain/entities/movie_entity.dart';
import 'package:movies_app/features/Home/domain/repositiries/search_repository.dart';

import '../data_sources/search_remote_data_source.dart';

@Injectable(as: SearchRepository)
class SearchRepositoryImpl
    implements SearchRepository {

  final SearchRemoteDataSource remoteDataSource;

  SearchRepositoryImpl(this.remoteDataSource);

  @override

Future<List<MovieEntity>> searchMovies(
  String query,
  int page,
) async {
  return await remoteDataSource.searchMovies(
    query,
    page,
  );
}
}