import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gibt_app/models/user.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import 'components/body.dart';
import 'components/bottom_nav.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(user: user),
      bottomNavigationBar: BottomNavBar(user: user,),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: user.themeColor,
      elevation: 0,
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
          icon: const Icon(LineAwesomeIcons.angle_left)),
    );
  }
}
