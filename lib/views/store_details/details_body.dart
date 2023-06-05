import 'package:flutter/material.dart';

import '../../constants/sizes.dart';
import '../../models/user.dart';
import '../../theme/colors.dart';
import 'image_and_icons.dart';
import 'title_and_price.dart';

class DetailsBody extends StatelessWidget {
  const DetailsBody({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.price,
    required this.user,
  });

  final String image, title, description;
  final int price;
  final User user;

  void buyItem(BuildContext context) {
    switch (title) {
      case "Lumpy":
      case "Scared Morty":
        {
          if (user.balance >= price) {
            user.balance -= price;
            user.profilePhoto = image;
          }
          break;
        }
      case "Green":
        {
          if (user.balance >= price) {
            user.balance -= price;
            user.themeColor = const AppColors().greenColor;
            user.themeSecondaryColor = const AppColors().greenSecondaryColor;
          }
          break;
        }

      default:
        {
          break;
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ItemImage(size: size, image: image, user: user),
          TitleAndPrice(
            title: title,
            description: description,
            price: price,
            user: user,
          ),
          const SizedBox(height: tDefaultPadding),
          Row(
            children: <Widget>[
              SizedBox(
                width: size.width / 2,
                height: 54,
                child: TextButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(user.themeColor),
                  ),
                  onPressed: () {
                    buyItem(context);
                  },
                  child: const Text(
                    "Buy",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Expanded(
                child: TextButton(
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(user.themeColor),
                  ),
                  onPressed: () {},
                  child: const Text("Description"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
