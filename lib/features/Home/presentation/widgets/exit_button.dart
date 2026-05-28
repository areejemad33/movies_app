import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/resources/assets_manager.dart';
import 'package:movies_app/core/resources/colors_manager.dart';

import '../../../../core/routes/routes_manager.dart';

class ExitButton extends StatelessWidget {
  final bool isFullWidth;

  const ExitButton({
    super.key,
    this.isFullWidth = true,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isFullWidth ? double.infinity : null,
      height: 55.h,
      child: ElevatedButton(
        onPressed:  (){
          Navigator.pushNamed(context, RoutesManager.login);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorsManager.red,
          foregroundColor: ColorsManager.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child:  Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
         Text( "Exit", style: GoogleFonts.roboto(
          fontSize: 20.sp,
          fontWeight: FontWeight.w400,
          color: ColorsManager.white,
        )),
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(AssetsManager.exitIcon),  
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: 20.w),
                  Image.asset(AssetsManager.lineIcon),
                  Image.asset(AssetsManager.arrowIcon),
                ],
              ),
            ],
          )

      ])
      ),
    );
  }
}