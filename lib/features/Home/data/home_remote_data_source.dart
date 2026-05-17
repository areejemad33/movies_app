import 'package:movies_app/core/api/api_manager.dart';
import 'package:movies_app/features/Home/data/models/movie_model.dart';

class HomeRemoteDataSource {

  Future<List<MovieModel>> getLatestMovies() async {

    final response = await ApiManager.dio.get(
      "list_movies.json",
      queryParameters: {
        "sort_by": "date_added",
      },
    );

    List movies = response.data['data']['movies'];

    return movies
        .map((e) => MovieModel.fromJson(e))
        .toList();
  }
}