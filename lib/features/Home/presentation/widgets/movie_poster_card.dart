import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:movies_app/features/Home/domain/entities/movie_entity.dart';
import 'package:movies_app/features/Home/presentation/widgets/rating_badge.dart';

class MoviePosterCard extends StatelessWidget {
  final MovieEntity movie;

  const MoviePosterCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 234.w,
      height: 351.h,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.r)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.r),
        child: Stack(
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 400),
              child: Container(
                key: ValueKey(movie.image),
                height: 645.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(movie.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            RatingBadge(rating: movie.rating),
          ],
        ),
      ),
    );
  }
}
