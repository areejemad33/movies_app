import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/di/dependency_injection.dart';

import 'package:movies_app/features/Home/presentation/cubit/home/home_cubit.dart';
import 'package:movies_app/features/Home/presentation/screens/home_screen.dart';
import 'package:movies_app/features/auth/login/presentation/screens/login_screen.dart';
import 'package:movies_app/features/auth/register/presentation/screens/register_screen.dart';
import 'package:movies_app/features/auth/reset_password/presentation/screens/reset_password_screen.dart';



import 'package:movies_app/features/movie_details/presentation/cubit/movie_details_cubit.dart';
import 'package:movies_app/features/movie_details/presentation/screens/movie_details.dart';


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
case RoutesManager.home:
  return MaterialPageRoute(
    builder: (_) => BlocProvider(
      create: (_) => getIt<HomeCubit>()..loadHome(),
      child: HomeScreen(),
    ),
  );

      case RoutesManager.onBoarding:
        return MaterialPageRoute(
          builder: (_) => const OnboardingScreen(),
        );
      case RoutesManager.updateProfile:
        return MaterialPageRoute(
          builder: (_) => const UpdateProfileScreen(),
        );

    

         case RoutesManager.movieDetails:
  final movieId = settings.arguments as int;

  return MaterialPageRoute(
    builder: (_) => BlocProvider(
      create: (_) => getIt<MovieDetailsCubit>()..getMovieDetails(movieId),
      child: MovieDetails(movieId: movieId),
    ),
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