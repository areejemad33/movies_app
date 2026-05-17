import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/resources/colors_manager.dart';

class DeleteAccountButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isFullWidth;
  final bool isLoading;

  const DeleteAccountButton({
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
          backgroundColor: ColorsManager.red,
          foregroundColor: ColorsManager.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: isLoading
            ? const CircularProgressIndicator()
            : Text(text, style: GoogleFonts.roboto(
          fontSize: 20.sp,
          fontWeight: FontWeight.w400,
          color: ColorsManager.white,
        ),),
      ),
    );
  }
}