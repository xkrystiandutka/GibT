import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../constants/sizes.dart';
import '../constants/text_strings.dart';
import '../models/user.dart';
import '../theme/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        appBarTheme: AppBarTheme(
          color: user.themeColor, // Replace with your desired color
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context); // Navigate back to the previous screen
              },
              icon: const Icon(LineAwesomeIcons.angle_left)),
          title: const Text(tProfile),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(tDefaultSize),
          child: Column(
            children: [
              SizedBox(
                width: 100,
                height: 100,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image(
                    image: AssetImage(user.profilePhoto),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(user.profileName,
                  style: Theme.of(context).textTheme.headlineMedium),
              Text(user.profileEmail,
                  style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          user.themeColor), // Replace with your desired color
                    ),
                    child: const Text(tEditProfile),
                  )),
              const SizedBox(
                height: 30,
              ),
              const Divider(),
              const SizedBox(height: 10),

              ///MENU
              ProfileMenuWidget(
                  user: user,
                  title: "Settings",
                  icon: LineAwesomeIcons.cog,
                  onPress: () {}),
              ProfileMenuWidget(
                  user: user,
                  title: "Billing Details",
                  icon: LineAwesomeIcons.wallet,
                  onPress: () {}),
              ProfileMenuWidget(
                  user: user,
                  title: "User Management",
                  icon: LineAwesomeIcons.user_check,
                  onPress: () {}),
              const Divider(
                color: Colors.grey,
              ),
              const SizedBox(
                height: 10,
              ),
              ProfileMenuWidget(
                  user: user,
                  title: "Information",
                  icon: LineAwesomeIcons.info,
                  onPress: () {}),
              ProfileMenuWidget(
                  user: user,
                  title: "Logout",
                  icon: LineAwesomeIcons.alternate_sign_out,
                  textColor: Colors.red,
                  endIcon: false,
                  onPress: () {}),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
    required this.user,
  });

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;
  final User user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: user.themeSecondaryColor.withOpacity(0.1),
        ),
        child: Icon(
          icon,
          color: user.themeSecondaryColor,
        ),
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyMedium?.apply(color: textColor),
      ),
      trailing: endIcon
          ? Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.grey.withOpacity(0.1),
              ),
              child: const Icon(
                LineAwesomeIcons.angle_right,
                color: Colors.grey,
              ),
            )
          : null,
    );
  }
}
