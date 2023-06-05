import 'package:flutter/material.dart';

import 'colors.dart';

@immutable
class AppTheme {
  static const colors = AppColors();

  const AppTheme._();

  static ThemeData define() {
    return ThemeData(
        fontFamily: "Inter",
        primaryColor: const Color(0xFF7553F6),
        primaryColorDark: const Color(0xFF4E23F3),
        primaryColorLight: const Color(0xFF53F6C6),
        primarySwatch: MaterialColor(colors.primaryColor.value, {
          50: colors.primaryColor,
          100: colors.primaryColor,
          200: colors.primaryColor,
          300: colors.primaryColor,
          400: colors.primaryColor,
          500: colors.primaryColor,
          600: colors.primaryColor,
          700: colors.primaryColor,
          800: colors.primaryColor,
          900: colors.primaryColor,
        }));
  }
}
