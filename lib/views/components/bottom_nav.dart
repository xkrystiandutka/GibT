import 'package:flutter/material.dart';

import '../../constants/sizes.dart';
import '../../models/user.dart';


class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: tDefaultPadding * 2,
        right: tDefaultPadding * 2,
        bottom: tDefaultPadding,
      ),
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -10),
            blurRadius: 35,
            color: user.themeColor.withOpacity(0.38),
          ),
        ],
      ),
    );
  }
}