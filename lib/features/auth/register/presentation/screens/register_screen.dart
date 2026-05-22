import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/widgets/app_button.dart';
import 'package:movies_app/core/widgets/app_language_switch.dart';
import 'package:movies_app/features/auth/register/presentation/widgets/already_have_account.dart';
import 'package:movies_app/features/auth/register/presentation/widgets/avatar_selector.dart';
import 'package:movies_app/features/auth/register/presentation/widgets/register_form.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: Text("Register", style: Theme.of(context).textTheme.titleMedium),)  ,  


      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 8.w),
          child: Column(
            children: [
            
              AvatarSelector(),
                  SizedBox(height: 10.h),
                Text("Avatar", style: Theme.of(context).textTheme.bodyLarge),
        
              SizedBox(height: 12.h),
              RegisterForm(),
              SizedBox(height: 24.h),
            AppButton(
  text: "Create Account",
  onPressed: () {
    Navigator.pushNamed(context, "/home");
  },
),
              SizedBox(height: 18.h),
              AlreadyHaveAccount(),
              SizedBox(height: 18.h),
              AppLanguageSwitch(),
            ],
          ),
        ),
      ),
    );
  }
}