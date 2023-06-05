import 'package:flutter/material.dart';

import '../../constants/sizes.dart';
import '../../models/user.dart';
import '../../theme/colors.dart';

class TitleAndPrice extends StatelessWidget {
  const TitleAndPrice(
      {super.key,
      required this.title,
      required this.description,
      required this.price,
      required this.user});

  final String title, description;
  final int price;
  final User user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: tDefaultPadding),
      child: Row(
        children: <Widget>[
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "$title\n",
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Colors.black38, fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: description,
                  style: TextStyle(
                    fontSize: 20,
                    color: user.themeColor,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Text(
            "\$$price",
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(color: user.themeColor),
          )
        ],
      ),
    );
  }
}
