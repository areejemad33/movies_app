import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/resources/assets_manager.dart';
import 'package:movies_app/core/utils/validators/auth_validator.dart';
import 'package:movies_app/core/widgets/app_text_form_field.dart';

class ProfileForm extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController phoneController;

  const ProfileForm({
    super.key,
    required this.nameController,
    required this.phoneController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        AppTextFormField(
          controller: nameController,
          prefixIcon: Image.asset(AssetsManager.profileIcon),
          hintText: 'Name',
          validator: AuthValidators.name,
        ),

        SizedBox(height: 19.h),

        AppTextFormField(
          controller: phoneController,
          hintText: 'Phone',
          prefixIcon: Image.asset(AssetsManager.phoneIcon),
          keyboardType: TextInputType.phone,
          validator: AuthValidators.phone,
        ),
      ],
    );
  }
}