import 'package:flutter/material.dart';
import 'package:flutter/src/services/text_formatter.dart';

class AppTextFormField extends StatelessWidget {
  final String? Function(String?)? validator;
  final String hintText;

  final Widget? prefixIcon;
    final Widget? suffixIcon;


  final bool obscureText;

  final TextInputType keyboardType;

  final TextEditingController? controller;
  
    final  int ?maxLength ;
    final  MaxLengthEnforcement ?maxLengthEnforcement ;
   const AppTextFormField({
    super.key,
    required this.hintText,

    this.prefixIcon,
    this.suffixIcon,

    this.obscureText = false,

    this.keyboardType = TextInputType.text,

    this.controller,
    required this.validator, 
  
    this.maxLength,
    this.maxLengthEnforcement 
  });

  @override
  Widget build(BuildContext context) {

  return TextFormField(
  controller: controller,
  validator: validator,
  obscureText: obscureText,
  keyboardType: keyboardType,

  maxLength: maxLength,
  maxLengthEnforcement: maxLengthEnforcement,

  decoration: InputDecoration(
    hintText: hintText,
    hintStyle: Theme.of(context).textTheme.bodyLarge,
    prefixIcon: prefixIcon,
    suffixIcon: suffixIcon,
  ),
);
  }
}