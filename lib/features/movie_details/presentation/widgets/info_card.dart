import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/resources/colors_manager.dart';

class Infocard extends StatelessWidget {
  const Infocard({super.key, required this.icon, required this.text});
  final String icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 47.h,
      width: 122.w,
      decoration: BoxDecoration(
        color: ColorsManager.black28,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            child: Image.asset(icon, width: 28.w, fit: BoxFit.contain),
          ),
          const SizedBox(width: 12),
          Text(text, style: Theme.of(context).textTheme.labelLarge),
        ],
      ),
    );
  }
}
