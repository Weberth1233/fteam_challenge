import 'package:flutter/material.dart';
import 'package:fteam_challenge/app/presentation/ui/theme/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeTypography {
  static TextTheme getTextTheme() {
    return TextTheme(
      displayLarge: _style(32, FontWeight.bold, AppColors.surface),
      headlineLarge: _style(28, FontWeight.bold, AppColors.surface),
      headlineSmall: _style(24, FontWeight.bold, AppColors.surface),
      titleLarge: _style(20, FontWeight.bold, AppColors.textPrimary),
      bodyMedium: _style(16, FontWeight.normal, AppColors.textPrimary),
      bodySmall: _style(13, FontWeight.normal, AppColors.textPrimary),
      labelSmall: _style(14, FontWeight.normal, AppColors.textPrimary),
    );
  }

  static TextStyle _style(double size, FontWeight weight, Color color) {
    return GoogleFonts.roboto(fontSize: size, fontWeight: weight, color: color);
  }

  static final TextTheme textThemeLight = getTextTheme();
}
