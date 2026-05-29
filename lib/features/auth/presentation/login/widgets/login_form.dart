import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/validators/auth_validator.dart';
import '../../../../../core/resources/assets_manager.dart';
import '../../../../../core/widgets/app_text_form_field.dart';

class LoginForm extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const LoginForm({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextFormField(
          controller: widget.emailController,
          hintText: "Email",
          prefixIcon: Image.asset(AssetsManager.emailIcon),
          keyboardType: TextInputType.emailAddress,
          validator: AuthValidators.email
        ),
        SizedBox(height: 22.5.h),
        AppTextFormField(
          controller: widget.passwordController,
          hintText: "Password",
          prefixIcon: Image.asset(AssetsManager.passwordIcon),
          obscureText: _obscurePassword,
          suffixIcon: GestureDetector(
            onTap: () =>
                setState(() => _obscurePassword = !_obscurePassword),
            child:  _obscurePassword?
            Image.asset(
              AssetsManager.eyeOff)
                  : Icon(Icons.remove_red_eye),
            
          ),
          validator: AuthValidators.password
        )
      ],
    );
  }
}