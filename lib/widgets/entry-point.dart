import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gibt_app/models/rive-asset.dart';
import 'package:gibt_app/views/countdown-page.dart';
import 'package:gibt_app/widgets/side-menu.dart';
import 'package:rive/rive.dart';

import '../models/menu-button.dart';
import '../utils/rive-utils.dart';

class EntryPoint extends StatefulWidget {
  const EntryPoint({super.key});

  @override
  State<StatefulWidget> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint>
    with SingleTickerProviderStateMixin {
  late SMIBool isSideBarClosed;

  late AnimationController _animationController;
  late Animation<double> animation;

  bool isSideMenuClosed = true;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    )..addListener(() {
        setState(() {});
      });

    animation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn),
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: Stack(
        children: [
          AnimatedPositioned(
              width: 300,
              left: isSideMenuClosed ? -300 : 0,
              height: MediaQuery.of(context).size.height,
              duration: Duration(milliseconds: 200),
              curve: Curves.fastOutSlowIn,
              child: SideMenu()),
          Transform.translate(
              offset: Offset(animation.value * 288, 0),
              child: Transform.scale(
                  scale: isSideMenuClosed ? 1 : 0.8,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                    child: const CountdownPage(),
                  ))),
          MenuButton(
            riveOnInit: (artboard) {
              StateMachineController controller = RiveUtils.getRiveController(
                  artboard,
                  stateMachineName: "State Machine");
              isSideBarClosed = controller.findSMI("isOpen") as SMIBool;
              isSideBarClosed.value = true;
            },
            press: () {
              isSideBarClosed.value = !isSideBarClosed.value;
              if (isSideMenuClosed) {
                _animationController.forward();
              } else {
                _animationController.reverse();
              }
              setState(() {
                isSideMenuClosed = isSideBarClosed.value;
              });
            },
          )
        ],
      ),
    );
  }
}
