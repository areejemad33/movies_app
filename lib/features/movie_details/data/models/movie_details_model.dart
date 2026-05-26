import 'package:movies_app/features/movie_details/data/models/cast_model.dart';

import '../../domain/entities/movie_details_entity.dart';

class MovieDetailsModel extends MovieDetailsEntity {
  MovieDetailsModel({
    required super.id,
    required super.title,
    required super.description,
    required super.image,
  
    required super.rating,
    required super.year,
    required super.runtime,
    required super.genres,
      required super.likeCount,
       required super.screenshots, 
       required super.cast,
  });


  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailsModel(
      id: json['movie_id'] ?? json['id'],
      title: json['title'] ?? '',
      description: json['description_full'] ?? '',
      image: json['medium_cover_image'] ?? '',
      rating: (json['rating'] ?? 0).toDouble(),
      year: json['year'] ?? 0,
      runtime: json['runtime'] ?? 0,
      genres: List<String>.from(json['genres'] ?? []),
      likeCount: json['like_count'] ?? 0,

      screenshots: [
        json['large_screenshot_image1'] ?? '',
        json['large_screenshot_image2'] ?? '',
        json['large_screenshot_image3'] ?? '',
      ].map((e) => e.toString()).where((e) => e.isNotEmpty).toList(),

      cast: (json['cast'] as List? ?? [])
    .map((e) => CastModel.fromJson(e))
    .toList(),
    );
  }
}
