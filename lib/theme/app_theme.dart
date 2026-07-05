import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // App colors
  static const Color lightBackground = Color(0xffFFF1F5);
  static const Color darkBackground = Colors.black;

  static const Color white = Colors.white;
  static const Color black = Colors.black;

  static final Color primaryPink = Colors.pink.shade300;

  // Returns the correct background color.
  static Color background(bool isDark) {
    return isDark ? darkBackground : lightBackground;
  }

  // Returns the correct text color.
  static Color textColor(bool isDark) {
    return isDark ? white : black;
  }

  // App title style.
  static TextStyle titleStyle({
    double fontSize = 30,
    double letterSpacing = 0,
    Color? color,
  }) {
    return GoogleFonts.playfairDisplay(
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
      letterSpacing: letterSpacing,
      color: color ?? primaryPink,
    );
  }

  // Normal text style.
  static TextStyle bodyStyle({
    required bool isDark,
    double fontSize = 16,
    FontWeight fontWeight = FontWeight.normal,
    Color? color,
    double letterSpacing = 0,
  }) {
    return GoogleFonts.playfairDisplay(
      fontSize: fontSize,
      fontWeight: fontWeight,
      letterSpacing: letterSpacing,
      color: color ?? textColor(isDark),
    );
  }
}
