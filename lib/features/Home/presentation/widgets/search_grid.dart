import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/entities/movie_entity.dart';
import 'movie_card.dart';

class SearchGrid extends StatelessWidget {
  final List<MovieEntity> movies;
  final ScrollController scrollController;
  final bool isLoadingMore;

  const SearchGrid({
    super.key,
    required this.movies,
    required this.scrollController,
    required this.isLoadingMore,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: scrollController,
      itemCount:
          movies.length + (isLoadingMore ? 1 : 0),
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16.w,
        mainAxisSpacing: 16.h,
        childAspectRatio: 0.62,
      ),
      itemBuilder: (context, index) {
        if (index >= movies.length) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return MovieCard(
          movie: movies[index] ,
        );
      },
    );
  }
}