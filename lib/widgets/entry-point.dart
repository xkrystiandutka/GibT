import 'dart:ffi';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gibt_app/models/rive-asset.dart';
import 'package:gibt_app/views/countdown-page.dart';
import 'package:gibt_app/widgets/side-menu.dart';
import 'package:rive/rive.dart';

import '../constants/image_strings.dart';
import '../constants/text_strings.dart';
import '../models/menu-button.dart';
import '../models/user.dart';
import '../theme/colors.dart';
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
  late Animation<double> scalAnimation;
  late final User user;

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
    scalAnimation = Tween<double>(begin: 1, end: 0.8).animate(
      CurvedAnimation(
          parent: _animationController, curve: Curves.fastOutSlowIn),
    );

    user = User(
        balance: 1000,
        profileName: tProfileName,
        profileEmail: tProfileEmail,
        profilePhoto: tProfileImage,
        profileLevel: 3,
        themeColor: const AppColors().primaryColor,
        themeSecondaryColor: const AppColors().secondaryColor
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
      backgroundColor: user.themeColor,
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: Stack(
        children: [
          AnimatedPositioned(
              width: 300,
              left: isSideMenuClosed ? -300 : 0,
              height: MediaQuery.of(context).size.height,
              duration: const Duration(milliseconds: 200),
              curve: Curves.fastOutSlowIn,
              child: const SideMenu()),
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(animation.value - 30 * animation.value * pi / 180),
            child: Transform.translate(
                offset: Offset(animation.value * 265, 0),
                child: Transform.scale(
                    scale: scalAnimation.value,
                    child: const ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(24)),
                      child: CountdownPage(),
                    ))),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            curve: Curves.fastOutSlowIn,
            left: isSideMenuClosed ? 0 : 220,
            top: 16,
            child: MenuButton(
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
            ),
          )
        ],
      ),
    );
  }
}
