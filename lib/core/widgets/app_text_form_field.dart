import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {

  final String hintText;

  final Widget? prefixIcon;
    final Widget? suffixIcon;


  final bool obscureText;

  final TextInputType keyboardType;

  final TextEditingController? controller;

  const AppTextFormField({
    super.key,

    required this.hintText,

    this.prefixIcon,
    this.suffixIcon,

    this.obscureText = false,

    this.keyboardType = TextInputType.text,

    this.controller,
  });

  @override
  Widget build(BuildContext context) {

    return TextFormField(

      controller: controller,

      obscureText: obscureText,

      keyboardType: keyboardType,

      decoration: InputDecoration(

        hintText: hintText,

        hintStyle:
            Theme.of(context).textTheme.bodyLarge,

        prefixIcon: prefixIcon,
         suffixIcon: suffixIcon,
      ),
    );
  }
}