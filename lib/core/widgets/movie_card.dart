import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/resources/colors_manager.dart';
import 'package:movies_app/features/Home/domain/entities/movie_entity.dart';
import 'package:movies_app/core/widgets/rating_badge.dart';

class MovieCard extends StatelessWidget {
  final MovieEntity movie;
  final VoidCallback? onTap;

  const MovieCard({
    super.key,
    required this.movie,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: CachedNetworkImage(
                imageUrl: movie.image,
                fit: BoxFit.cover,

                placeholder: (context, url) => Container(
                  color: ColorsManager.black28,
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
              ),
            ),
          ),

          RatingBadge(
            rating: movie.rating,
          ),
        ],
      ),
    );
  }
}