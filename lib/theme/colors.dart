import 'package:flutter/material.dart';

@immutable
class AppColors {
  final lime = const Color(0xFFD4F653);
  final primaryColor = const Color(0xFF7553F6);
  final secondaryColor = const Color(0xFF8873d6);
  final greenColor = const Color(0xDF59DB83);
  final greenSecondaryColor = const Color(0xCB56B271);

  const AppColors();

  Gradient createGradient() {
    return const LinearGradient(
      colors: [
        Colors.blue,
        Colors.green,
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      // Define additional properties such as stops and tileMode if needed
      // stops: [0.0, 0.5, 1.0],
      // tileMode: TileMode.clamp,
    );
  }
}