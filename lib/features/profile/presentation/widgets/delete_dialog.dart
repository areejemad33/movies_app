import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/colors_manager.dart';
import 'delete_account_button.dart';

class DeleteAccountDialog extends StatelessWidget {
  final VoidCallback onDelete;

  const DeleteAccountDialog({
    super.key,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: ColorsManager.black28,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Padding(
        padding: REdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            Container(
              width: 80.w,
              height: 80.h,
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(.15),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.delete_outline_rounded,
                color: Colors.red,
                size: 40.sp,
              ),
            ),

            SizedBox(height: 20.h),

            Text(
              'Delete Account',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(
                fontSize: 22.sp,
                fontWeight: FontWeight.w700,
              ),
            ),

            SizedBox(height: 12.h),

            Text(
              'Are you sure you want to delete your account?\nThis action cannot be undone.',
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 28.h),

            Row(
              children: [

                Expanded(
                child: OutlinedButton(
  style: OutlinedButton.styleFrom(
    backgroundColor: Colors.transparent,

    side: BorderSide(
      color: ColorsManager.yellow,
      width: 1.5,
    ),

    padding: REdgeInsets.symmetric(
      vertical: 14.h,
    ),

    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16.r),
    ),
  ),

  onPressed: () => Navigator.pop(context),

  child: Text(
    'Cancel',

    style: Theme.of(context)
        .textTheme
        .bodyLarge
        ?.copyWith(
          color: ColorsManager.white,
          fontWeight: FontWeight.w600,
          fontSize: 16.sp,
        ),
  ),
),
                ),

                SizedBox(width: 16.w),

                Expanded(
                  child: DeleteAccountButton(
                    text: 'Delete',
                    isFullWidth: false,
                    onPressed: onDelete,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}