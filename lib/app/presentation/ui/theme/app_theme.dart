import 'package:flutter/material.dart';
import 'package:fteam_challenge/app/presentation/ui/theme/app_typography.dart';

class AppTheme {
  static ThemeData get defaultTheme => ThemeData(
    scaffoldBackgroundColor: const Color.fromARGB(255, 246, 246, 248),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromARGB(255, 5, 4, 10),
      elevation: 0,
      centerTitle: true,
    ),
    textTheme: ThemeTypography.textThemeLight,
  );
}
