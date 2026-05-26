import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/features/movie_details/presentation/widgets/heading_text.dart';
import 'package:movies_app/features/movie_details/presentation/widgets/screenshot_cards.dart';

class ScreenshotHeading extends StatelessWidget {
  final List<String> screenshots;

  const ScreenshotHeading({
    super.key,
    required this.screenshots,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: SizedBox(
        height: 580.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeadingText(text: 'Screen Shots',),

            SizedBox(height: 9.h),

            Expanded(
              child: ListView.separated(
                itemCount: screenshots.length,
                separatorBuilder: (_, __) => SizedBox(height: 13.h),
                itemBuilder: (context, index) {
                  return ScreenshotCards(
                    image: screenshots[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}