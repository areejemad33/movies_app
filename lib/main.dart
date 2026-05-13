import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/config/theme/theme_manager.dart';
import 'package:movies_app/core/routes/routes_generator.dart';
import 'package:movies_app/core/routes/routes_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        initialRoute: RoutesManager.register,
      ),
    );
  }
}
