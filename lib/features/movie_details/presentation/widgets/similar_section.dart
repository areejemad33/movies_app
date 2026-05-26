import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/resources/assets_manager.dart';
import 'package:movies_app/core/routes/routes_manager.dart';
import 'package:movies_app/features/Home/presentation/widgets/rating_badge.dart';
import 'package:movies_app/features/movie_details/domain/entities/movie_details_entity.dart';
import 'package:movies_app/features/movie_details/presentation/widgets/heading_text.dart';

class SimilarSection extends StatelessWidget {
final List<MovieDetailsEntity> movies;

const SimilarSection({
  super.key,
  required this.movies,
});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: const HeadingText(text: 'Similar'),
        ),

        SizedBox(height: 16.h),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: movies.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20.w,
              mainAxisSpacing: 19.h,
              childAspectRatio: 0.72,
            ),
    itemBuilder: (context, index) {
  final image = movies[index].image;

  return Stack(
    children: [
      GestureDetector(
          onTap: () {
              Navigator.pushNamed(
                context,
                RoutesManager.movieDetails,
                arguments: movies[index].id,
              );
            },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.r),
          child: CachedNetworkImage(
            imageUrl: image,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
      ),

      RatingBadge(
        rating: movies[index].rating,
      ),
    ],
  );
},
          ),
        ),
        SizedBox(height: 16.h),
      ],
    );
  }
}
