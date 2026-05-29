import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_app/core/resources/assets_manager.dart';
import 'package:movies_app/core/widgets/app_button.dart';
import 'package:movies_app/features/auth/presentation/login/cubit/sign_in_with_google_cubit.dart';
import 'package:movies_app/features/auth/presentation/login/cubit/sign_in_with_google_states.dart';

class GoogleLoginButton extends StatelessWidget {
  const GoogleLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GoogleAuthCubit, GoogleAuthState>(
      builder: (context, state) {
        return AppButton(
          text: "Login With Google",
          icon: SvgPicture.asset(
            AssetsManager.googleIcon,
          ),
          isLoading: state is GoogleAuthLoading,
         onPressed: () {
                                context
                                    .read<GoogleAuthCubit>()
                                    .signInWithGoogle();
                              },
        );
      },
    );
  }
}