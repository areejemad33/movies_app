// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import '../../domain/entities/movie_entity.dart';
// import 'movie_card.dart';

// class SearchGrid extends StatelessWidget {
//   final List<MovieEntity> movies;
//   final ScrollController scrollController;
//   final bool isLoadingMore;

//   const SearchGrid({
//     super.key,
//     required this.movies,
//     required this.scrollController,
//     required this.isLoadingMore,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//       controller: scrollController,
//       itemCount:
//           movies.length + (isLoadingMore ? 1 : 0),
//       gridDelegate:
//           SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         crossAxisSpacing: 16.w,
//         mainAxisSpacing: 16.h,
//         childAspectRatio: 0.68,
//       ),
//       itemBuilder: (context, index) {
//         if (index >= movies.length) {
//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         }

//         return MovieCard(
//           movie: movies[index],
//         );
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/routes/routes_manager.dart';
import 'package:movies_app/core/widgets/movie_card.dart';
import 'package:movies_app/features/Home/domain/entities/movie_entity.dart';

class MoviePagedGrid extends StatelessWidget {
  final List<MovieEntity> movies;
  final ScrollController controller;
  final bool isLoadingMore;
  final VoidCallback? onLoadMore;
  final EdgeInsetsGeometry padding;

  const MoviePagedGrid({
    super.key,
    required this.movies,
    required this.controller,
    required this.isLoadingMore,
    this.onLoadMore,
    required this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (scrollInfo) {
        if (scrollInfo.metrics.pixels >=
            scrollInfo.metrics.maxScrollExtent - 300) {
          onLoadMore?.call();
        }
        return false;
      },
      child: GridView.builder(
        controller: controller,
        padding: padding,
        itemCount: movies.length + (isLoadingMore ? 1 : 0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20.w,
          mainAxisSpacing: 8.h,
          childAspectRatio: 0.68,
        ),
        itemBuilder: (context, index) {
          if (index >= movies.length) {
            return const Center(child: CircularProgressIndicator());
          }

          return MovieCard(
            movie: movies[index],
            onTap: () {
              Navigator.pushNamed(
                context,
                RoutesManager.movieDetails,
                arguments: movies[index].id,
              );
            },
          );
        },
      ),
    );
  }
}
