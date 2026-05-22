import 'package:injectable/injectable.dart';
import 'package:movies_app/core/api/api_manager.dart';
import 'package:movies_app/features/Home/data/models/movie_model.dart';


@injectable
class HomeRemoteDataSource {
  final ApiManager apiManager;
  HomeRemoteDataSource(this.apiManager);

  Future<List<MovieModel>> getLatestMovies() async {
    final response = await apiManager.dio.get(
      "list_movies.json",
      queryParameters: {"sort_by": "date_added"},
    );

    List movies = response.data['data']['movies'];

    return movies.map((e) => MovieModel.fromJson(e)).toList();
  }

  Future<List<MovieModel>> getMoviesByGenre(String genre) async {
    final response = await apiManager.dio.get(
      "list_movies.json",
      queryParameters: {"genre": genre, "sort_by": "rating"},
    );

    List movies = response.data['data']['movies'];

    return movies.map((e) => MovieModel.fromJson(e)).toList();
  }
}
