import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/resources/colors_manager.dart';

class PushButton extends StatelessWidget {
  PushButton({super.key,required this.title, required this.onNext});
final String title;
Function() onNext;
  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize:  Size(389.w, 55.h),
          backgroundColor: ColorsManager.yellow,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onPressed: onNext, child: Text(title,style: Theme.of(context).textTheme.displayMedium,));
  }
}
