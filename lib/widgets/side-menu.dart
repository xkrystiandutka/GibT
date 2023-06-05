import 'package:flutter/material.dart';
import 'package:gibt_app/widgets/side-menu-title.dart';
import 'package:rive/rive.dart';
import '../constants/image_strings.dart';
import '../models/user.dart';

import '../constants/text_strings.dart';
import '../models/rive-asset.dart';
import '../theme/colors.dart';
import '../utils/rive-utils.dart';
import '../views/achievement-page.dart';
import '../views/profile-page.dart';
import '../views/settings-page.dart';
import '../views/store-page.dart';
import 'info-card.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  RiveAsset selectedMenu = sideMenus.first;
  final User user = User(
      balance: 1000,
      profileName: tProfileName,
      profileEmail: tProfileEmail,
      profilePhoto: tProfileImage,
      profileLevel: 3,
      themeColor: const AppColors().primaryColor,
      themeSecondaryColor: const AppColors().secondaryColor
  );

  void navigateToScreen(String screenTitle) {
    // Navigate to the respective screen based on the menu item pressed
    if (screenTitle == 'Profile') {
      navigateToProfileScreen();
    } else if (screenTitle == 'Store') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => StoreScreen(user: user)),
      );
    } else if (screenTitle == 'Achievements') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const AchievementsScreen()),
      );
    } else if (screenTitle == 'Settings') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SettingsScreen()),
      );
    }
  }

  void navigateToProfileScreen() {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(-1, 0), // Slide in from the left side
              end: Offset.zero,
            ).animate(
              CurvedAnimation(
                parent: animation1,
                curve: Curves.easeIn, // Apply ease-in curve
              ),
            ),
            child: ProfileScreen(user: user),
          );
        },
      ),
    );
  }

  void navigateToStoreScreen() {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(-1, 0), // Slide in from the left side
              end: Offset.zero,
            ).animate(
              CurvedAnimation(
                parent: animation1,
                curve: Curves.easeIn, // Apply ease-in curve
              ),
            ),
            child: StoreScreen(user: user),
          );
        },
      ),
    );
  }

  void navigateToAchievementsScreen() {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(-1, 0), // Slide in from the left side
              end: Offset.zero,
            ).animate(
              CurvedAnimation(
                parent: animation1,
                curve: Curves.easeIn, // Apply ease-in curve
              ),
            ),
            child: const AchievementsScreen(),
          );
        },
      ),
    );
  }

  void navigateToSettingsScreen() {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(-1, 0), // Slide in from the left side
              end: Offset.zero,
            ).animate(
              CurvedAnimation(
                parent: animation1,
                curve: Curves.easeIn, // Apply ease-in curve
              ),
            ),
            child: const SettingsScreen(),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 300,
        height: double.infinity,
        color: user.themeColor,
        child: SafeArea(
          child: Column(
            children: [
              Center(
                child: InfoCard(
                  name: user.profileName,
                  level: 'level ${user.profileLevel}',
                  user: user,
                ),
              ),
              const Padding(
                  padding: EdgeInsets.only(left: 24, top: 32, bottom: 16)),
              ...sideMenus.map(
                (menu) => SideMenuTitle(
                  menu: menu,
                  user: user,
                  riveonInit: (artboard) {
                    StateMachineController controller =
                        RiveUtils.getRiveController(artboard,
                            stateMachineName: menu.stateMachineName);
                    menu.input = controller.findSMI("active") as SMIBool;
                  },
                  press: () {
                    menu.input!.change(true);
                    Future.delayed(const Duration(seconds: 1), () {
                      menu.input!.change(false);
                    });
                    setState(() {
                      selectedMenu = menu;
                    });

                    navigateToScreen(menu.title);
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
