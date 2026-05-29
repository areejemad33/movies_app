import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/resources/colors_manager.dart';
import 'package:movies_app/features/profile/presentation/cubit/profile/profile_states.dart';
import 'package:movies_app/features/profile/presentation/widgets/profile_actions.dart';
import 'package:movies_app/features/profile/presentation/widgets/profile_info_section.dart';
import 'package:movies_app/features/profile/presentation/widgets/profile_tabs.dart';

class ProfileHeader extends StatelessWidget {

  final ProfileSuccess state;

  const ProfileHeader({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsManager.black21,
      child: Padding(
        padding: REdgeInsets.only(
          left: 16,
          right: 16,
          top: 52,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            ProfileInfoSection(state: state),

            SizedBox(height: 23.h),

            const ProfileActions(),

            SizedBox(height: 30.h),

            const ProfileTabs(),
          ],
        ),
      ),
    );
  }
}