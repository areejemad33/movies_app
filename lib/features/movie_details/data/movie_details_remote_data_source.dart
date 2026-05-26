import 'package:injectable/injectable.dart';
import 'package:movies_app/core/api/api_manager.dart';
import 'package:movies_app/features/movie_details/data/models/movie_details_model.dart';


@injectable
class MovieDetailsRemoteDataSource {
  final ApiManager apiManager;
  MovieDetailsRemoteDataSource(this.apiManager);

  Future<MovieDetailsModel> getMovieDetails(int movieId) async {
    final response = await apiManager.dio.get(
      "movie_details.json",
      queryParameters: {
        "movie_id": movieId,
        "with_images": true,
        "with_cast": true,
      },
    );

    final data = response.data;

    print("MOVIE DETAILS RESPONSE: $data");  

    final movieJson = data['data']?['movie'] ?? data['movie'];

    if (movieJson == null) {
      throw Exception("Movie is null - check API response structure");
    }

    return MovieDetailsModel.fromJson(movieJson);
  }

Future<List<MovieDetailsModel>> getSimilarMovies(int movieId) async {
  final response = await apiManager.dio.get(
    "movie_suggestions.json",
    queryParameters: {
      "movie_id": movieId,
    },
  );

  final data = response.data;

  final movies = data['data']?['movies'] as List?;

  if (movies == null) {
    return [];
  }

  return movies
      .map((e) => MovieDetailsModel.fromJson(e))
      .toList();
}

}
