import 'package:movies_app/features/movie_details/domain/entities/cast_entity.dart';

class CastModel extends CastEntity {
  CastModel({
    required super.name,
    required super.characterName,
    required super.image,
  });

  factory CastModel.fromJson(Map<String, dynamic> json) {
    return CastModel(
      name: json['name'] ?? '',
      characterName: json['character_name'] ?? '',
    image:
    json['url_medium_image'] ??
    json['url_small_image'] ??
    '',
    );
  }
}