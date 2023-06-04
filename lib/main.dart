import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gibt_app/theme/app-theme.dart';
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

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Countdown app',
      theme: AppTheme.define(),
      home: const EntryPoint(),
    );
  }
}
