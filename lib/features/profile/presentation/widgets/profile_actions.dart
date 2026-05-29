import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/routes/routes_manager.dart';
import 'package:movies_app/core/widgets/app_button.dart';
import 'package:movies_app/features/profile/presentation/cubit/profile/profile_cubit.dart';
import 'package:movies_app/features/profile/presentation/widgets/exit_button.dart';

class ProfileActions extends StatelessWidget {
  const ProfileActions({super.key});

  @override
  Widget build(BuildContext context) {

    return Row(
      children: [

        Expanded(
          flex: 2,
          child: AppButton(
            text: 'Edit Profile',
            onPressed: () {
              Navigator.pushNamed(
                context,
                RoutesManager.updateProfile,
              ).then((_) {
                context
                    .read<ProfileCubit>()
                    .getProfile();
              });
            },
          ),
        ),

        SizedBox(width: 10.w),

        Expanded(
          flex: 1,
          child: ExitButton(),
        ),
      ],
    );
  }
}