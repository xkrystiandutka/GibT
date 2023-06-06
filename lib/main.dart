import 'package:flutter/material.dart';
import 'package:gibt_app/theme/app-theme.dart';
import 'package:gibt_app/widgets/entry-point.dart';
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
      theme: ThemeData(
        primarySwatch: Colors.purple,
        iconTheme: const IconThemeData(color: Colors.purpleAccent),
      ),
      home: const EntryPoint(),
    );
  }
}
