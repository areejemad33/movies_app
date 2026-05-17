import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/resources/assets_manager.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 413.w,
      height: 61.h,
      margin: const EdgeInsets.all(9),
      padding: EdgeInsets.symmetric(horizontal: 9.w),

      decoration: BoxDecoration(
        color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
        borderRadius: BorderRadius.circular(16.r),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(
            AssetsManager.homeIcon,
            color: Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
          ),
          Image.asset(
            AssetsManager.searchIcon,
            color: Theme.of(
              context,
            ).bottomNavigationBarTheme.unselectedItemColor,
          ),
          Image.asset(
            AssetsManager.exploreIcon,
            color: Theme.of(
              context,
            ).bottomNavigationBarTheme.unselectedItemColor,
          ),
          Image.asset(
            AssetsManager.profileIcon,
            color: Theme.of(
              context,
            ).bottomNavigationBarTheme.unselectedItemColor,
          ),
        ],
      ),
    );
  }
}
