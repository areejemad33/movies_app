import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/resources/colors_manager.dart';
import 'package:movies_app/features/movie_details/domain/entities/movie_details_entity.dart';

class MovieHeaderSection extends StatelessWidget {
  const MovieHeaderSection({super.key, required this.movie});
  final MovieDetailsEntity movie;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 645.h,
      child: Stack(
        children: [
          /// Background Image
          CachedNetworkImage(
            imageUrl: movie.image,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            placeholder: (context, url) => Container(color: Colors.black),
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
                  ColorsManager.black.withOpacity(0.2),
                  ColorsManager.black,
                ],
                stops: const [0.0, 1.0],
              ),
            ),
          ),

          /// Content
          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
              child: Column(
                children: [
                  /// Top Bar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.bookmark_rounded,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 185.h),

                  /// Play Button
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      /// Outer Yellow Circle
                      Container(
                        width: 97.w,
                        height: 97.h,
                        decoration: BoxDecoration(
                          color: ColorsManager.yellow,
                          shape: BoxShape.circle,
                        ),
                      ),

                      /// Main Button
                      Container(
                        width: 87.w,
                        height: 87.h,
                        decoration: BoxDecoration(
                          color: ColorsManager.yellow,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: ColorsManager.white,
                            width: 10.r,
                          ),
                        ),
                        child: const Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                          size: 50,
                        ),
                      ),
                    ],
                  ),

                  const Spacer(),

                  /// Title
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: Text(
                      movie.title,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),

                  SizedBox(height: 18.h),

                  /// Year
                  Text(
                    movie.year.toString(),
                    style: GoogleFonts.roboto(
                      color: const Color(0XffADADAD),
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
