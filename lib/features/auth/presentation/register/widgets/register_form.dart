import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/resources/assets_manager.dart';
import 'package:movies_app/core/utils/validators/auth_validator.dart';
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
  validator: AuthValidators.name,
    ),
        SizedBox(height: 24.h),
        AppTextFormField(

          controller:widget.emailController,
      hintText: "Email",
      prefixIcon: Image.asset(AssetsManager.emailIcon),
      keyboardType: TextInputType.emailAddress,
        validator: AuthValidators.email,
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
          validator: (value) =>
    AuthValidators.confirmPassword(
      value,
      widget.passwordController.text,
    ),
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



  maxLength: 11,
  maxLengthEnforcement: MaxLengthEnforcement.enforced,

  validator: AuthValidators.phone
),
      ],
    );
  }
}
