import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/core/resources/assets_manager.dart';
import 'package:movies_app/core/resources/colors_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginWithGoogleButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isFullWidth;
  final bool isLoading;

  const LoginWithGoogleButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isFullWidth = true,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isFullWidth ? double.infinity : null,
      height: 55.h,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorsManager.yellow,
          foregroundColor: ColorsManager.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: isLoading
            ? const CircularProgressIndicator()
            : Row(
mainAxisAlignment: MainAxisAlignment.center,
          children: [
                SvgPicture.asset(AssetsManager.googleIcon),
                SizedBox(width: 11.2.w,),
                Text(text, style: Theme.of(context).textTheme.displaySmall),
              ],
            ),
      ),
    );
  }
}