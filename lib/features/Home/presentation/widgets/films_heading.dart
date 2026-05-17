import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/resources/colors_manager.dart';

class FilmsHeading extends StatelessWidget {
  const FilmsHeading({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Action", style: Theme.of(context).textTheme.titleLarge),
          Row(
            children: [
              Text("See More ", style: Theme.of(context).textTheme.titleMedium),
              Icon(Icons.arrow_forward, color: ColorsManager.yellow, size: 16),
            ],
          ),
        ],
      ),
    );
  }
}
