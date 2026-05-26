import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/routes/routes_manager.dart';
import 'package:movies_app/features/Home/domain/entities/movie_entity.dart';
import 'package:movies_app/features/Home/presentation/widgets/movie_poster_card.dart';

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
    onTap: () {
      Navigator.pushNamed(
        context,
        RoutesManager.movieDetails,
        arguments: movie.id,
      );
    },
    child: MoviePosterCard(movie: movie),
  );
},
    );
  }
}