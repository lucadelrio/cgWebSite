import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  void toggleTheme() {
    _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  void setSystemTheme() {
    _themeMode = ThemeMode.system;
    notifyListeners();
  }
}

class AppTheme {
  // Colori Sociali
  static const Color primaryAmber = Color(0xFFFFC000); // Giallo più chiaro / acceso
  static const Color primaryNavy = Color(0xFF004CA3); // Blu più chiaro e vivace

  static final TextTheme appTextTheme = TextTheme(
    displayLarge: GoogleFonts.montserrat(fontSize: 57, fontWeight: FontWeight.bold),
    displayMedium: GoogleFonts.montserrat(fontSize: 45, fontWeight: FontWeight.bold),
    displaySmall: GoogleFonts.montserrat(fontSize: 36, fontWeight: FontWeight.bold),
    headlineMedium: GoogleFonts.montserrat(fontSize: 28, fontWeight: FontWeight.bold),
    titleLarge: GoogleFonts.roboto(fontSize: 22, fontWeight: FontWeight.w600),
    titleMedium: GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w600),
    bodyLarge: GoogleFonts.openSans(fontSize: 16),
    bodyMedium: GoogleFonts.openSans(fontSize: 14),
    labelLarge: GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.w600),
  );

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryAmber,
      primary: primaryAmber,
      onPrimary: primaryNavy,
      secondary: primaryNavy,
      onSecondary: Colors.white,
      brightness: Brightness.light,
    ),
    textTheme: appTextTheme,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: primaryNavy,
      elevation: 1,
      shadowColor: Colors.black12,
      titleTextStyle: GoogleFonts.montserrat(fontSize: 24, fontWeight: FontWeight.bold, color: primaryNavy),
      iconTheme: const IconThemeData(color: primaryNavy),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: primaryNavy,
        backgroundColor: primaryAmber,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        textStyle: GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryAmber,
      primary: primaryAmber,
      onPrimary: primaryNavy,
      secondary: const Color(0xFF112240),
      onSecondary: Colors.white,
      surface: const Color(0xFF0A192F),
      brightness: Brightness.dark,
    ),
    scaffoldBackgroundColor: const Color(0xFF0A192F),
    textTheme: appTextTheme.apply(bodyColor: Colors.white70, displayColor: Colors.white),
    appBarTheme: AppBarTheme(
      backgroundColor: const Color(0xFF020C1B),
      foregroundColor: Colors.white,
      titleTextStyle: GoogleFonts.montserrat(fontSize: 24, fontWeight: FontWeight.bold, color: primaryAmber),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: primaryNavy,
        backgroundColor: primaryAmber,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        textStyle: GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    ),
  );
}
