import 'package:flutter/material.dart';

class AlreadyHaveAccount extends StatelessWidget {
  const AlreadyHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Already have an account? ", style: Theme.of(context).textTheme.titleSmall),
        Text(
          "Login",
          style:Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}