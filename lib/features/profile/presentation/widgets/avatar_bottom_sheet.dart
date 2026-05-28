import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:movies_app/core/resources/assets_manager.dart';
import 'package:movies_app/core/resources/colors_manager.dart';

class AvatarBottomSheet extends StatefulWidget {

  final Function(String avatarId) onAvatarSelected;
  final String selectedAvatarId;

  const AvatarBottomSheet({
    super.key,
    required this.onAvatarSelected,
    required this.selectedAvatarId,
  });

  @override
  State<AvatarBottomSheet> createState() =>
      _AvatarBottomSheetState();
}

class _AvatarBottomSheetState
    extends State<AvatarBottomSheet> {

  late String currentAvatarId;

  @override
  void initState() {
    super.initState();

    currentAvatarId = widget.selectedAvatarId;
  }

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: REdgeInsets.symmetric(
        vertical: 17.h,
        horizontal: 16.w,
      ),

      child: Container(

        decoration: BoxDecoration(
          color: ColorsManager.black28,
          borderRadius: BorderRadius.circular(24.r),
        ),

        child: Padding(
          padding: REdgeInsets.all(19),

          child: GridView.builder(

            shrinkWrap: true,

            itemCount:
                AssetsManager.avatars.length,

            gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),

            itemBuilder: (context, index) {

              final bool isSelected =
                  currentAvatarId ==
                      index.toString();

              return InkWell(

                onTap: () {

                  setState(() {

                    currentAvatarId =
                        index.toString();
                  });

                  widget.onAvatarSelected(
                    index.toString(),
                  );

                  Navigator.pop(context);
                },

                child: Container(

                  decoration: BoxDecoration(

                    border: Border.all(
                      color: ColorsManager.yellow,
                      width: isSelected ? 3 : 1,
                    ),

                    borderRadius:
                        BorderRadius.circular(20.r),

                    color: isSelected
                        ? ColorsManager.yellow
                            .withOpacity(.56)
                        : ColorsManager.black28,
                  ),

                  child: Image.asset(
                    AssetsManager.avatars[index],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}