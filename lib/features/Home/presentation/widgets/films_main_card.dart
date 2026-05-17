


// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:movies_app/core/resources/assets_manager.dart';
// import 'package:movies_app/features/Home/domain/entities/movie_entity.dart';

// class FilmsMain extends StatefulWidget {
//   final List<MovieEntity> movies;

//   const FilmsMain({
//     super.key,
//     required this.movies,
//   });

//   @override
//   State<FilmsMain> createState() => _FilmsMainState();
// }

// class _FilmsMainState extends State<FilmsMain> {
//   int currentIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     final currentMovie = widget.movies[currentIndex];

//     return Stack(
//       children: [

//         Container(
//           height: 645.h,
//           decoration: BoxDecoration(
//             image: DecorationImage(
//               image: NetworkImage(currentMovie.image),
//               fit: BoxFit.cover,
//             ),
//           ),
//         ),

//         Container(
//           height: 645.h,
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//               colors: [
//                 Colors.black.withOpacity(0.8),
//                 Colors.black.withOpacity(0.6),
//                 Colors.black,
//               ],
//               stops: const [0.0, 0.465, 1.0],
//             ),
//           ),
//         ),

//         Center(
//           child: Column(
//             children: [


//               Image.asset(
//                 height: 93.h,
//                 width: 257.w,
//                 AssetsManager.availableNow,
//               ),

//               CarouselSlider.builder(
//                 itemCount: widget.movies.length,
//                 options: CarouselOptions(
//                   height: 351.h,
//                   viewportFraction: 0.6,
//                   enlargeCenterPage: true,

//                   /// IMPORTANT
//                   onPageChanged: (index, reason) {
//                     setState(() {
//                       currentIndex = index;
//                     });
//                   },
//                 ),
//                 itemBuilder: (context, index, realIndex) {
//                   final movie = widget.movies[index];

//                   return Container(
//                     width: 234.w,
//                     height: 351.h,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20.r),
//                       image: DecorationImage(
//                         image: NetworkImage(movie.image),
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                       child: Align(
//               alignment: Alignment.topLeft,
//               child: Container(
//                 margin: const EdgeInsets.all(10),
//                 padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
//                 decoration: BoxDecoration(
//                   color: Colors.black54,
//                   borderRadius: BorderRadius.circular(10.r),
//                 ),
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Text(widget.movies[index].rating.toString(), style: Theme.of(context).textTheme.bodyLarge),
//                     SizedBox(width: 5.w),
//                     Image.asset(AssetsManager.starIcon, width: 15.w),
//                   ],
//                 ),
//               ),
//             ),
//                   );
//                 },
//               ),

//               Image.asset(
//                 width: 354.w,
//                 height: 146.h,
//             AssetsManager.watchNow,
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

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

  placeholder: (context, url) =>
      Container(color: Colors.black),

  errorWidget: (context, url, error) =>
      Container(color: Colors.black),
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
                width: 257.w,
                AssetsManager.availableNow,
              ),

              /// CAROUSEL (separated widget)
              MoviesCarousel(
                movies: movies,
                onChanged: onPageChanged,
              ),

              Image.asset(
                width: 354.w,
                height: 146.h,
                AssetsManager.watchNow,
              ),
            ],
          ),
        ),
      ],
    );
  }
}