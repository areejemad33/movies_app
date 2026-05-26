import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movies_app/core/config/theme/theme_manager.dart';
import 'package:movies_app/core/di/dependency_injection.dart';
import 'package:movies_app/core/routes/routes_generator.dart';
import 'package:movies_app/core/routes/routes_manager.dart';
import 'package:movies_app/firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();


  await GoogleSignIn.instance.initialize();
  await Firebase.initializeApp(

    options: DefaultFirebaseOptions.currentPlatform,
  );

    configureDependencies();
  final prefs = await SharedPreferences.getInstance();
  final seenOnboarding = prefs.getBool('seen_onboarding') ?? false;
  runApp( MyApp(seenOnboarding: seenOnboarding));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.seenOnboarding});
  final bool seenOnboarding;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(430, 932),
        minTextAdapt: true,
        splitScreenMode: true,
      builder: (_, _) =>  MaterialApp(
        debugShowCheckedModeBanner: false,
      
        theme: ThemeManager.darkTheme,
        onGenerateRoute: RouteGenerator.getRoute,
    
              initialRoute: seenOnboarding
            ? RoutesManager.updateProfile

      : RoutesManager.onBoarding,

      ),
    );
  }
}
