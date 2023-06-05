import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/image_strings.dart';
import '../models/user.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    super.key,
    required this.name,
    required this.level,
    required this.user,
  });

  final String name, level;
  final User user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.white24,
        radius: 25, // Adjust the radius as needed
        child: ClipOval(
          child: Image(
            image: AssetImage(user.profilePhoto),
            fit: BoxFit.cover,
          ),
        ),
      ),
      title: Text(
        name,
        style: const TextStyle(color: Colors.white),
      ),
      subtitle: Text(
        level,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
