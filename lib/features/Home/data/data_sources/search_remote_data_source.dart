import 'package:injectable/injectable.dart';
import 'package:movies_app/features/Home/data/models/movie_model.dart';
import 'package:movies_app/features/Home/domain/entities/movie_entity.dart';

import '../../../../core/api/api_manager.dart';

@injectable
class SearchRemoteDataSource {
  final ApiManager apiManager;

  SearchRemoteDataSource(this.apiManager);

Future<List<MovieEntity>> searchMovies(
  String query,
  int page,
) async {
  final response = await apiManager.dio.get(
    "list_movies.json",
    queryParameters: {
      "query_term": query,
      "page": page,
    },
  );

  final List moviesJson =
      response.data['data']['movies'] ?? [];

  return moviesJson
      .map(
        (movie) => MovieModel.fromJson(movie),
      )
      .toList();
}
}