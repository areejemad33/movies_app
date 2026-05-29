import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/resources/assets_manager.dart';
import 'package:movies_app/core/resources/colors_manager.dart';
import 'package:movies_app/features/profile/presentation/cubit/profile/profile_states.dart';

class ProfileInfoSection extends StatelessWidget {

  final ProfileSuccess state;

  const ProfileInfoSection({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {

    return Row(
      children: [

        Expanded(
          child: Column(
            children: [

              Image.asset(
                AssetsManager.avatars[
   int.tryParse(state.avatarId) ?? 0                ],
                width: 118.w,
                height: 118.h,
                fit: BoxFit.contain,
              ),

              SizedBox(height: 15.h),

              Text(
                state.name,
                style: GoogleFonts.roboto(
                  color: ColorsManager.white,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),

        SizedBox(width: 40.w),

        Expanded(
          child: Column( children: [ Text( '${state.watchListCount}', style: GoogleFonts.roboto( color: ColorsManager.white, fontSize: 36.sp, fontWeight: FontWeight.w700, ), ), SizedBox(height: 20.h), Text( "Watch List", style: GoogleFonts.roboto( color: ColorsManager.white, fontSize: 24.sp, fontWeight: FontWeight.w700, ), ), ], ),
        ),

        Expanded(
          child: Column(
            
             children: [ Text( '${state.historyCount}', style: GoogleFonts.roboto( color: ColorsManager.white, fontSize: 36.sp, fontWeight: FontWeight.w700, ), ), SizedBox(height: 20.h), Text( "History", style: GoogleFonts.roboto( color: ColorsManager.white, fontSize: 24.sp, fontWeight: FontWeight.w700, ), ), ], ),
        ),
      ],
    );
  }
}