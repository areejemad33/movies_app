import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/resources/colors_manager.dart';

class CategoryItem extends StatelessWidget {

  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryItem({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    return InkWell(
      borderRadius: BorderRadius.circular(16),

      onTap: onTap,

      child: Container(

  height: 48.h,

  padding: EdgeInsets.symmetric(
    horizontal: 12.w,
  ),

  alignment: Alignment.center,

  decoration: BoxDecoration(

    color: isSelected
        ? ColorsManager.yellow
        : Colors.transparent,

    borderRadius:
        
        BorderRadius.circular(16),

    border: Border.all(
      width: 2,
      color: ColorsManager.yellow,
    ),
  ),

  child: Text(
    title,

    style: GoogleFonts.inter(
      fontSize: 20.sp,
      fontWeight: FontWeight.w700,

      color: isSelected
          ? ColorsManager.black
          : ColorsManager.yellow,
    ),
  ),
),
    );
  }
}