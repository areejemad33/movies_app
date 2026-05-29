import 'package:flutter/material.dart';
import 'package:movies_app/core/routes/routes_manager.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            RoutesManager.resetPassword,
          );
        },
        child: Text(
          'Forget Password ?',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}