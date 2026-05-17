import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/resources/colors_manager.dart';

class ThemeManager {
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: ColorsManager.black,
    primaryColor: ColorsManager.yellow,
    colorScheme: const ColorScheme.dark(primary: ColorsManager.yellow),
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorsManager.black,

      elevation: 0,

      centerTitle: true,

      iconTheme: IconThemeData(color: ColorsManager.yellow, size: 24),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorsManager.yellow,
        foregroundColor: ColorsManager.black28,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: ColorsManager.black28,
      selectedItemColor: ColorsManager.yellow,
      unselectedItemColor: ColorsManager.white,
      type: BottomNavigationBarType.fixed,
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: ColorsManager.black28,

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide.none,
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: ColorsManager.yellow),
      ),

      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: ColorsManager.red),
      ),
    ),

    textTheme: TextTheme(
      // size: 16 - white
      bodyLarge: GoogleFonts.roboto(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: ColorsManager.white,
      ),

      // size: 14 - yellow
      bodyMedium: GoogleFonts.roboto(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: ColorsManager.yellow,
      ),

      // size: 20 - black28
      headlineLarge: GoogleFonts.roboto(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: ColorsManager.black,
      ),

      // size: 15 - yellow
      bodySmall: GoogleFonts.roboto(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: ColorsManager.yellow,
      ),

      // size: 16 - yellow
      titleMedium: GoogleFonts.roboto(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: ColorsManager.yellow,
      ),

      // size: 16 - white
      titleLarge: GoogleFonts.roboto(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: ColorsManager.white,
      ),
      titleSmall: GoogleFonts.roboto(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: ColorsManager.white,
      ),
    ),
  );
}
