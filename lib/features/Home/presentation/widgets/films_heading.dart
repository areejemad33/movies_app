import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/resources/colors_manager.dart';

class FilmsHeading extends StatelessWidget {
  final String title;

  const FilmsHeading({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleLarge),

          Row(
            children: [
              Text("See More", style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(width: 4),
              const Icon(Icons.arrow_forward, size: 16, color: ColorsManager.yellow),
            ],
          ),
        ],
      ),
    );
  }
}
