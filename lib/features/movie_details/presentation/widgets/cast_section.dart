import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/resources/colors_manager.dart';
import 'package:movies_app/features/movie_details/domain/entities/cast_entity.dart';
import 'package:movies_app/features/movie_details/presentation/widgets/heading_text.dart';

class CastSection extends StatelessWidget {
  final List<CastEntity> cast;

  const CastSection({
    super.key,
    required this.cast,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeadingText(text: 'Cast'),
          SizedBox(height: 10.h),

          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: cast.length,
            itemBuilder: (context, index) {
              final actor = cast[index];

              return Container(
                padding: EdgeInsets.all(10.w),
                decoration: BoxDecoration(
                  color: ColorsManager.black28,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12.r),
                      child: CachedNetworkImage(
                        imageUrl: actor.image,
                        width: 70.w,
                        height: 70.h,
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                            Container(
                              width: 70.w,
                              height: 70.h,
                              color: ColorsManager.black28,
                            ),
                        errorWidget: (context, url, error) =>
                            Container(
                              width: 70.w,
                              height: 70.h,
                              color:ColorsManager.black28,
                              child: const Icon(Icons.person, color: Colors.white),
                            ),
                      ),
                    ),

                    SizedBox(width: 14.w),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Name : ${actor.name}',
                            style: Theme.of(context).textTheme.labelSmall
                          ),
                          SizedBox(height: 6.h),
                          Text(
                            'Character : ${actor.characterName}',
                           style: Theme.of(context).textTheme.labelSmall
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (_, __) => SizedBox(height: 8.h),
          ),

          SizedBox(height: 24.h),
        ],
      ),
    );
  }
}