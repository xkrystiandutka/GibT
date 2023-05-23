import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gibt_app/utils/rive-utils.dart';
import 'package:gibt_app/widgets/entry-point.dart';
import 'package:rive/rive.dart';
import 'models/menu-button.dart';
import 'views/countdown-page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF7553F6);
    final primarySwatch = MaterialColor(primaryColor.value, const {
      50: primaryColor,
      100: primaryColor,
      200: primaryColor,
      300: primaryColor,
      400: primaryColor,
      500: primaryColor,
      600: primaryColor,
      700: primaryColor,
      800: primaryColor,
      900: primaryColor,
    });

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Countdown app',
      theme: ThemeData(
        primarySwatch: primarySwatch,
      ),
      home: const EntryPoint(),
    );
  }
}
