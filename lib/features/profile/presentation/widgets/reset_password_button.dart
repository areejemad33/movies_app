import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/resources/colors_manager.dart';

class ResetPasswordButton extends StatelessWidget {
  final VoidCallback onPressed;

  const ResetPasswordButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          'Reset Password',
          style: GoogleFonts.roboto(
            fontSize: 20.sp,
            fontWeight: FontWeight.w400,
            color: ColorsManager.white,
          ),
        ),
      ),
    );
  }
}