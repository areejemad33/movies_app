import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/resources/assets_manager.dart';
import 'package:movies_app/core/resources/colors_manager.dart';

class FilmsMain extends StatelessWidget {
  const FilmsMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 645.h,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AssetsManager.filmImage),
              fit: BoxFit.cover,
            ),
          ),
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

        Center(
          child: Column(
            children: [
              Image.asset(
                height: 93.h,
                width: 257.w,
                AssetsManager.availableNow,
              ),
              Container(
                width: 234.w,
                height: 351.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  image: const DecorationImage(
                    image: AssetImage(AssetsManager.filmImage),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Image.asset(width: 354.w, height: 146.h, AssetsManager.watchNow),
            ],
          ),
        ),
      ],
    );
  }
}
