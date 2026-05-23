import 'package:flutter/material.dart';
import 'package:movies_app/features/auth/login/presentation/screens/login_screen.dart';
import 'package:movies_app/features/auth/register/presentation/screens/register_screen.dart';
import 'package:movies_app/features/auth/reset_password/presentation/screens/reset_password_screen.dart';
import '../../features/onBoarding/presentation/screens/onboarding_screen.dart';
import '../../features/profile/presentation/screens/update_profile._screen.dart';
import 'routes_manager.dart';

class RouteGenerator {

  static Route<dynamic> getRoute(RouteSettings settings) {

    switch (settings.name) {

      case RoutesManager.login:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );

    
  
      case RoutesManager.register:
        return MaterialPageRoute(
          builder: (_) =>  RegisterScreen(),
        );

      case RoutesManager.resetPassword:
        return MaterialPageRoute(
          builder: (_) => const ResetPasswordScreen(),
        );

      case RoutesManager.onBoarding:
        return MaterialPageRoute(
          builder: (_) => const OnboardingScreen(),
        );
      case RoutesManager.updateProfile:
        return MaterialPageRoute(
          builder: (_) => const UpdateProfileScreen(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text("No Route Found"),
            ),
          ),
        );
    }
  }
}