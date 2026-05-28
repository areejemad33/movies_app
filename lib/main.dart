import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movies_app/core/config/theme/theme_manager.dart';
import 'package:movies_app/core/di/dependency_injection.dart';
import 'package:movies_app/core/local_storage/prefs_manager.dart';
import 'package:movies_app/core/routes/routes_generator.dart';
import 'package:movies_app/core/routes/routes_manager.dart';
import 'package:movies_app/firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  configureDependencies(); 



  await GoogleSignIn.instance.initialize();

  final seenOnboarding = await PrefsManager.getSeenOnboarding();
  final isLoggedIn = PrefsManager.isLoggedIn();

  runApp(
    MyApp(
      seenOnboarding: seenOnboarding,
      isLoggedIn: isLoggedIn,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.seenOnboarding,
    required this.isLoggedIn,
  });

  final bool seenOnboarding;
  final bool isLoggedIn;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, _) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeManager.darkTheme,
        onGenerateRoute: RouteGenerator.getRoute,

        initialRoute:
            !seenOnboarding
                ? RoutesManager.onBoarding
                : isLoggedIn
                    ? RoutesManager.home
                    : RoutesManager.login,
      ),
    );
  }
}