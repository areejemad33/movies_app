import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/resources/colors_manager.dart';
import 'package:movies_app/features/movie_details/presentation/widgets/heading_text.dart';

class GenresSection extends StatelessWidget {
  const GenresSection({super.key, required this.genres});

  final List<String> genres;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeadingText(text: 'Genres'),
          SizedBox(height: 16.h),

          Wrap(
            spacing: 16.w,
            runSpacing: 16.h,
            children: genres
                .map(
                  (genre) => Container(
                    width: 122.w,
                    height: 36.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: ColorsManager.black28,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Text(
                      genre,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                )
                .toList(),
          ),
          SizedBox(height: 30.h),
        ],
      ),
    );
  }
}
