


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/resources/assets_manager.dart';

class BottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      
      width: 413.w,
      height: 61.h,
      margin: const EdgeInsets.all(9),
      padding: EdgeInsets.symmetric(horizontal: 9.w),

      decoration: BoxDecoration(
        color: Theme.of(context)
            .bottomNavigationBarTheme
            .backgroundColor,

        borderRadius: BorderRadius.circular(16.r),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [

          _buildNavItem(
            context: context,
            index: 0,
            icon: AssetsManager.homeIcon,
          ),

          _buildNavItem(
            context: context,
            index: 1,
            icon: AssetsManager.searchIcon,
          ),

          _buildNavItem(
            context: context,
            index: 2,
            icon: AssetsManager.exploreIcon,
          ),

          _buildNavItem(
            context: context,
            index: 3,
            icon: AssetsManager.profileIcon,
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required BuildContext context,
    required int index,
    required String icon,
  }) {
    final bool isSelected = currentIndex == index;

    return GestureDetector(
      onTap: () {
        onTap(index);
      },

      child: Image.asset(
        icon,

        color: isSelected
            ? Theme.of(context)
                .bottomNavigationBarTheme
                .selectedItemColor
            : Theme.of(context)
                .bottomNavigationBarTheme
                .unselectedItemColor,
      ),
    );
  }
}