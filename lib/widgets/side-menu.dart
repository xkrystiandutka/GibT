import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gibt_app/widgets/side-menu-title.dart';
import 'package:rive/rive.dart';

import '../models/rive-asset.dart';
import '../utils/rive-utils.dart';
import 'info-card.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  RiveAsset selectedMenu = sideMenus.first;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 300,
        height: double.infinity,
        color: Colors.black38,
        child: SafeArea(
          child: Column(
            children: [
              InfoCard(
                name: "Grzegorz",
                proffesion: "beginner",
              ),
              Padding(
                  padding:
                      const EdgeInsets.only(left: 24, top: 32, bottom: 16)),
              ...sideMenus.map(
                (menu) => SideMenuTitle(
                  menu: menu,
                  riveonInit: (artboard) {
                    StateMachineController controller = RiveUtils.getRiveController(artboard, stateMachineName: menu.stateMachineName);
                    menu.input = controller.findSMI("active") as SMIBool;
                  },
                  press: () {
                    menu.input!.change(true);
                    Future.delayed(Duration(seconds: 1), () {
                      menu.input!.change(false);
                    });
                    setState(() {
                      selectedMenu = menu;
                    });
                  },
                  isActive: selectedMenu == menu,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
