import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/resources/assets_manager.dart';
import 'package:movies_app/core/routes/routes_manager.dart';
import 'package:movies_app/core/widgets/movie_card.dart';

import '../../../Home/domain/entities/movie_entity.dart';
import '../cubit/profile/profile_cubit.dart';

class MoviesTab extends StatelessWidget {
  final List<Map<String, dynamic>> movies;
  final bool isLoading;

  const MoviesTab({
    super.key,
    required this.movies,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (movies.isEmpty) {
      return Center(
        child: Image.asset(
          AssetsManager.empty,
        ),
      );
    }

    return GridView.builder(
      padding: EdgeInsets.all(8.w),
      itemCount: movies.length,

      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 0.7,
      ),

      itemBuilder: (_, i) {
        final movie = MovieEntity(
          id: movies[i]['id'],
          title: movies[i]['title'] ?? '',
          image: movies[i]['poster'] ?? '',
          rating: (movies[i]['rating'] ?? 0).toDouble(),
        );

        return MovieCard(
          movie: movie,

          onTap: () {
            Navigator.pushNamed(
              context,
              RoutesManager.movieDetails,
              arguments: movie.id,
            ).then((_) {
              context.read<ProfileCubit>().getProfile();
            });
          },
        );
      },
    );
  }
}