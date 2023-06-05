import 'package:flutter/material.dart';

import '../../constants/sizes.dart';
import '../../models/user.dart';

class TitleWithMoreBtn extends StatelessWidget {
  const TitleWithMoreBtn({
    super.key,
    required this.title,
    required this.press,
    required this.user,
  });

  final String title;
  final VoidCallback press;
  final User user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: tDefaultPadding),
      child: Row(
        children: <Widget>[
          TitleWithCustomUnderline(text: title, user: user),
          const Spacer(),
          TextButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              backgroundColor:
                  MaterialStateProperty.all<Color>(user.themeColor),
            ),
            onPressed: press,
            child: const Text(
              "More",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class TitleWithCustomUnderline extends StatelessWidget {
  const TitleWithCustomUnderline({
    super.key,
    required this.text,
    required this.user,
  });

  final String text;
  final User user;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: tDefaultPadding / 4),
            child: Text(
              text,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: const EdgeInsets.only(right: tDefaultPadding / 4),
              height: 7,
              color: user.themeColor.withOpacity(0.2),
            ),
          )
        ],
      ),
    );
  }
}
