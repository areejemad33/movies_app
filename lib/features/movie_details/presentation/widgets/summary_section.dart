import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/features/movie_details/presentation/widgets/heading_text.dart';

class SummarySection extends StatelessWidget {
  const SummarySection({super.key, required this.description});
  final String description;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeadingText(text: 'Summary'),

          SizedBox(height: 8.h),

          Text(
             description,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }
}
