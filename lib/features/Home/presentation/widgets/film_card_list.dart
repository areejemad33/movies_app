import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/resources/assets_manager.dart';
import 'package:movies_app/features/Home/domain/entities/movie_entity.dart';
import 'package:movies_app/features/Home/presentation/widgets/rating_badge.dart';

class FilmCardList extends StatelessWidget {
  const FilmCardList({super.key, required List<MovieEntity> movies});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (context, index) {
          return Container(
            width: 146.w,
            height: 220.h,
            margin: const EdgeInsets.only(left: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              image: DecorationImage(
                image: AssetImage(AssetsManager.captainAmericanFilm),
                fit: BoxFit.cover,
              ),
            ),
            child:   RatingBadge(rating: 7.7),
          );
        },
      ),
    );
  }
}
