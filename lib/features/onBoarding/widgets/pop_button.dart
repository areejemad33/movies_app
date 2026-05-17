import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PopButton extends StatelessWidget {
 PopButton({super.key,required this.onBack});
Function() onBack;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        style: OutlinedButton.styleFrom(
          minimumSize:  Size(389.w, 55.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onPressed: onBack, child: Text('Back',style: Theme.of(context).textTheme.displayLarge,));
  }
}
