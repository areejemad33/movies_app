import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/resources/assets_manager.dart';
import 'package:movies_app/core/widgets/app_text_form_field.dart';


class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children:  [
      
    AppTextFormField(
      hintText: "Name",
      prefixIcon: Image.asset(AssetsManager.nameIcon),
    ),
        SizedBox(height: 24.h),
        AppTextFormField(
      hintText: "Email",
      prefixIcon: Image.asset(AssetsManager.emailIcon),
      keyboardType: TextInputType.emailAddress,
    ),
        SizedBox(height: 24.h),
         AppTextFormField(
      hintText: "Password",
      prefixIcon: Image.asset(AssetsManager.passwordIcon),
      suffixIcon: Image.asset(AssetsManager.eyeOff),
      obscureText: true,
    ),

        SizedBox(height: 24.h),
       AppTextFormField(
      hintText: "Confirm Password",
      prefixIcon: Image.asset(AssetsManager.passwordIcon),
      suffixIcon: Image.asset(AssetsManager.eyeOff),
      obscureText: true,
    ),
        SizedBox(height: 24.h),
       AppTextFormField(
      hintText: "Phone",
      prefixIcon: Image.asset(AssetsManager.phoneIcon),
      keyboardType: TextInputType.phone,
    ),
      ],
    );
  }
}