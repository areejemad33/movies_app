import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/resources/assets_manager.dart';
import 'package:movies_app/core/widgets/app_text_form_field.dart';


class RegisterForm extends StatefulWidget {
   RegisterForm({super.key, required this.nameController, required this.emailController, required this.passwordController, required this.confirmPasswordController, required this.phoneController});
   final TextEditingController nameController ;
 final  TextEditingController emailController ;
 final  TextEditingController passwordController ;
 final  TextEditingController confirmPasswordController;
 final  TextEditingController phoneController ;

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children:  [

    AppTextFormField(
      controller:widget.nameController,
      hintText: "Name",
      prefixIcon: Image.asset(AssetsManager.nameIcon),
      validator:  (value) {
        if (value == null || value.isEmpty) return 'Name is required';
        if (value.length < 3) return 'Name must be at least 3 characters';
        if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) return 'Name must contain letters only';
        return null;
      },
    ),
        SizedBox(height: 24.h),
        AppTextFormField(

          controller:widget.emailController,
      hintText: "Email",
      prefixIcon: Image.asset(AssetsManager.emailIcon),
      keyboardType: TextInputType.emailAddress,
          validator:  (value) {
            if (value == null || value.isEmpty) return 'Email is required';
            if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) return 'Enter a valid email';
            return null;
          },
    ),
        SizedBox(height: 24.h),
         AppTextFormField(
           controller: widget.passwordController,
      hintText: "Password",
      prefixIcon: Image.asset(AssetsManager.passwordIcon),
      suffixIcon: GestureDetector(
          onTap: () => setState(() => _obscurePassword = !_obscurePassword),
          child:  _obscurePassword ? Image.asset(
            AssetsManager.eyeOff ): Icon(Icons.remove_red_eye),),
      obscureText: _obscurePassword,
           validator: (value) {
             if (value == null || value.isEmpty) return 'Password is required';
             if (value.length < 8) return 'Password must be at least 8 characters';
             if (!RegExp(r'[A-Z]').hasMatch(value)) return 'Must contain uppercase letter';
             if (!RegExp(r'[0-9]').hasMatch(value)) return 'Must contain a number';
             return null;
           },
    ),

        SizedBox(height: 24.h),
       AppTextFormField(
         controller: widget.confirmPasswordController,
      hintText: "Confirm Password",
      prefixIcon: Image.asset(AssetsManager.passwordIcon),
      suffixIcon: GestureDetector(onTap: () => setState(() => _obscureConfirmPassword = !_obscureConfirmPassword),
          child: _obscureConfirmPassword ?  Image.asset(
           AssetsManager.eyeOff ): Icon(Icons.remove_red_eye)),
      obscureText: _obscureConfirmPassword,
         validator: (value) {
           if (value == null || value.isEmpty) return 'Confirm password is required';
           if (value != widget.passwordController.text) return 'Passwords do not match';
           return null;
         },
    ),
        SizedBox(height: 24.h),
       AppTextFormField(
         controller: widget.phoneController,
      hintText: "Phone",
      prefixIcon: Image.asset(AssetsManager.phoneIcon),
      keyboardType: TextInputType.phone,
         validator: (value) {
           if (value == null || value.isEmpty) return 'Phone is required';
           if (!RegExp(r'^01[0125][0-9]{8}$').hasMatch(value)) return 'Enter a valid Egyptian phone number';
           return null;
         },
    ),
      ],
    );
  }
}