import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/assets_manager.dart';
import '../../../../../core/widgets/app_text_form_field.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextFormField(
          hintText: "Email",
          prefixIcon: Image.asset(AssetsManager.emailIcon),
          keyboardType: TextInputType.emailAddress,
        ),
        SizedBox(height: 22.5.h,),
        AppTextFormField(
          hintText: "Password",
          prefixIcon: Image.asset(AssetsManager.passwordIcon),
          suffixIcon: Image.asset(AssetsManager.eyeOff),
          obscureText: true,
        ),
      ]

    );
  }
}
