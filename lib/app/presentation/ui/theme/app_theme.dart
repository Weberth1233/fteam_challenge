import 'package:flutter/material.dart';
import 'package:fteam_challenge/app/presentation/ui/theme/app_typography.dart';

class AppTheme {
  static ThemeData get defaultTheme => ThemeData(
    scaffoldBackgroundColor: const Color.fromARGB(255, 246, 246, 248),
    iconTheme: IconThemeData(color: Colors.grey),

    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF2F4F4F),
      elevation: 0,
      centerTitle: true,
    ),
    textTheme: ThemeTypography.textThemeLight,
  );
}
