import 'package:flutter/material.dart';

// Criamos uma extensão com um nome descritivo no BuildContext
extension ContextThemeExtension on BuildContext {
  /// Atalho para Theme.of(this).textTheme
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// Atalho para o ColorScheme principal
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
}
