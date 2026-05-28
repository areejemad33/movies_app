import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/routes/routes_manager.dart';
import 'package:movies_app/features/Home/data/models/movie_model.dart';
import 'package:movies_app/features/Home/domain/entities/movie_entity.dart';
import 'package:movies_app/features/Home/presentation/widgets/movie_poster_card.dart';
import 'package:movies_app/features/profile/presentation/cubit/tabs/tabs_cubit.dart';

class MoviesCarousel extends StatelessWidget {
  final List<MovieEntity> movies;
  final Function(int index) onChanged;

  const MoviesCarousel({
    super.key,
    required this.movies,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: movies.length,

      options: CarouselOptions(
        autoPlay: true,
        height: 351.h,
        viewportFraction: 0.6,
        enlargeCenterPage: true,

        onPageChanged: (index, reason) {
          onChanged(index);
        },
      ),

      itemBuilder: (context, index, realIndex) {
        final movie = movies[index];

        return GestureDetector(
          onTap: () async {
            await context.read<TabsCubit>().addToHistory(
                  MovieModel(
                    id: movie.id,
                    title: movie.title,
                    image: movie.image,
                    rating: movie.rating,
                  ),
                );

            Navigator.pushNamed(
              context,
              RoutesManager.movieDetails,
              arguments: movie.id,
            );
          },

          child: MoviePosterCard(
            movie: movie,
          ),
        );
      },
    );
  }
}