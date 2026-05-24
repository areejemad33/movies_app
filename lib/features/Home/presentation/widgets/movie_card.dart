import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/features/Home/presentation/widgets/rating_badge.dart';

import '../../domain/entities/movie_entity.dart';

class MovieCard extends StatelessWidget {

  final MovieEntity movie;

  const MovieCard({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [

        Positioned.fill(

          child: ClipRRect(
          

            borderRadius:
                BorderRadius.circular(16.r),

            child:CachedNetworkImage(
  imageUrl: movie.image,
  fit: BoxFit.cover,

  placeholder: (context, url) => Container(
    color: Colors.grey.shade300,
    child: const Center(
      child: CircularProgressIndicator(strokeWidth: 2),
    ),
  ),

  errorWidget: (context, url, error) => Container(
    color: Colors.grey.shade300,
    child: const Icon(
      Icons.broken_image_outlined,
      size: 40,
      color: Colors.grey,
    ),
  ),
)
          ),
        ),

        RatingBadge(
          rating: movie.rating,
        ),
      ],
    );
  }
}