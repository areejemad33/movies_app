import '../../domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  MovieModel({
    required super.id,
    required super.title,
    required super.image,
    required super.rating,
  });

  factory MovieModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return MovieModel(
      id: json['id'],
      title: json['title'] ?? '',
      image: json['medium_cover_image'] ?? '',
      rating: (json['rating'] ?? 0).toDouble(),
    );
  }
}