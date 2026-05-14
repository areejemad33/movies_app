import 'package:flutter/material.dart';
import 'package:movies_app/core/resources/assets_manager.dart';
import 'package:movies_app/core/widgets/app_button.dart';
import 'package:movies_app/core/widgets/app_text_form_field.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Forget Password', style: Theme.of(context).textTheme.titleMedium),
      ),
    body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
       Image.asset(AssetsManager.resetPassword ,),
         SizedBox(height: 24,),
            AppTextFormField(
        hintText: "Email",
        prefixIcon: Image.asset(AssetsManager.emailIcon),
        keyboardType: TextInputType.emailAddress,
      ),
         SizedBox(height: 24,),
                  AppButton(
        text: "Verify Email",
        onPressed: () {},
      )
        ]),
    )
    );
  }
}