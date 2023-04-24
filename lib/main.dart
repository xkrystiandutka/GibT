import 'package:flutter/material.dart';
import 'package:gibt_app/utils/rive-utils.dart';
import 'package:rive/rive.dart';
import 'models/menu-button.dart';
import 'views/countdown-page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  late SMIBool isMenuOpen;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Countdown app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Stack(children: [
        const CountdownPage(),
        MenuButton(
          riveOnInit: (artboard) {
            StateMachineController controller = RiveUtils.getRiveController(
                    artboard,
                    stateMachineName: "State Machine");
            isMenuOpen = controller.findSMI("Hover") as SMIBool;
            //isMenuOpen.value = !isMenuOpen.value;
          },
          press: () {
            isMenuOpen.value = !isMenuOpen.value;
          },
        )
      ]),
    );
  }
}
