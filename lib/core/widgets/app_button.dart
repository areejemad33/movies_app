import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/resources/colors_manager.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isFullWidth;
  final bool isLoading;
  final Widget? icon;
  final Color? backgroundColor;
  final Color? textColor;
  final TextStyle? textStyle;
  final BorderSide? borderSide;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isFullWidth = true,
    this.isLoading = false,
    this.icon,
    this.backgroundColor,
    this.textColor,
    this.textStyle,
    this.borderSide,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isFullWidth ? double.infinity : null,
      height: 56.h,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: backgroundColor ?? ColorsManager.yellow,
          foregroundColor: textColor ?? ColorsManager.black,

          side: borderSide,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),
          ),
        ),
        child: isLoading
            ? const CircularProgressIndicator()
            : icon == null
                ? Text(
                    text,
                    style:
                        textStyle ??
                        Theme.of(context).textTheme.headlineLarge,
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      icon!,
                      SizedBox(width: 10.w),
                      Text(
                        text,
                        style:
                            textStyle ??
                            Theme.of(context).textTheme.displaySmall,
                      ),
                    ],
                  ),
      ),
    );
  }
}