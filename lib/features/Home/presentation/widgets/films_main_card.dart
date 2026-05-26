import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/resources/assets_manager.dart';
import 'package:movies_app/core/resources/colors_manager.dart';
import 'package:movies_app/features/Home/domain/entities/movie_entity.dart';

import 'movies_carousel.dart';

class FilmsMain extends StatelessWidget {
  final List<MovieEntity> movies;
  final int currentIndex;
  final Function(int index) onPageChanged;

  const FilmsMain({
    super.key,
    required this.movies,
    required this.currentIndex,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    final movie = movies[currentIndex];

    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: movie.image,
          fit: BoxFit.cover,
          width: double.infinity,
          height: 645.h,
    
          placeholder: (context, url) => Container(color: Colors.black),
    
          errorWidget: (context, url, error) => Container(color: Colors.black),
        ),
    
        Container(
          height: 645.h,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                ColorsManager.black.withOpacity(0.8),
                ColorsManager.black.withOpacity(0.6),
                ColorsManager.black,
              ],
              stops: const [0.0, 0.465, 1.0],
            ),
          ),
        ),
    
        /// CONTENT (STATIC UI ONLY)
        Center(
          child: Column(
            children: [
              Image.asset(
                height: 93.h,
                width: 267.w,
                AssetsManager.availableNow,
              ),
              SizedBox(height: 21,),
    
              /// CAROUSEL (separated widget)
              MoviesCarousel(movies: movies, onChanged: onPageChanged),
                SizedBox(height: 21,),
    
              Image.asset(width: 354.w, height: 146.h, AssetsManager.watchNow),
            ],
          ),
        ),
      ],
    );
  }
}
