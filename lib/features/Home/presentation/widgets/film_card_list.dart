import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/routes/routes_manager.dart';
import 'package:movies_app/features/Home/domain/entities/movie_entity.dart';
import 'package:movies_app/features/Home/presentation/widgets/rating_badge.dart';

class FilmCardList extends StatelessWidget {
  final List<MovieEntity> movies;

  const FilmCardList({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];

          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, RoutesManager.movieDetails);
            },
            child: Container(
              width: 146,
              margin: const EdgeInsets.only(left: 16),

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                image: DecorationImage(
                  image: NetworkImage(movie.image),
                  fit: BoxFit.cover,
                ),
              ),

              child: RatingBadge(rating: movie.rating),
            ),
          );
        },
      ),
    );
  }
}
