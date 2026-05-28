import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/routes/routes_manager.dart';
import 'package:movies_app/core/widgets/movie_card.dart';
import 'package:movies_app/features/Home/domain/entities/movie_entity.dart';

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


          return Container(
            width: 160.w,
            margin: const EdgeInsets.only(left: 16),


            child: MovieCard(
              movie: movie,
              onTap: () {
                Navigator.pushNamed(
                  context,
                  RoutesManager.movieDetails,
                  arguments: movie.id,
                );
              },
            ),
          );
        },
      ),
    );
  }
}