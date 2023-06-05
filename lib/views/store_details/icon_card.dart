import 'package:flutter/material.dart';

import '../../constants/sizes.dart';
import '../../models/user.dart';
import '../../theme/colors.dart';

class IconCard extends StatelessWidget {
  final String icon;
  final User user;

  const IconCard({super.key, required this.icon, required this.user});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * 0.03),
      padding: const EdgeInsets.all(tDefaultPadding / 2),
      height: 62,
      width: 62,
      decoration: BoxDecoration(
        color: user.themeColor,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 15),
            blurRadius: 22,
            color: user.themeColor.withOpacity(0.22),
          ),
          const BoxShadow(
            offset: Offset(-15, -15),
            blurRadius: 20,
            color: Colors.white,
          ),
        ],
      ),
      child: Icon(icon as IconData?),
    );
  }
}
