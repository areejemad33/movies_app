import 'package:movies_app/features/movie_details/domain/entities/cast_entity.dart';

class MovieDetailsEntity {
  final int id;
  final String title;
  final String description;
  final String image;
  final double rating;
  final int year;
  final int runtime;
  final List<String> genres;
  final int likeCount;
  final List<String> screenshots;
  final List<CastEntity> cast;

  MovieDetailsEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.rating,
    required this.year,
    required this.runtime,
    required this.genres,
    required this.likeCount,
    required this.screenshots,
    required this.cast,
  });
}
