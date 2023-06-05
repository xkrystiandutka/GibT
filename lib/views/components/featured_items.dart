import 'package:flutter/material.dart';

import '../../constants/sizes.dart';

class FeaturedItems extends StatelessWidget {
  const FeaturedItems({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          FeaturedItemCard(
            image: "assets/images/store/featured/hello_kitty.png",
            press: () {},
          ),
          FeaturedItemCard(
            image: "assets/images/store/featured/llama.png",
            press: () {},
          ),
          FeaturedItemCard(
            image: "assets/images/store/featured/ninja.png",
            press: () {},
          ),
        ],
      ),
    );
  }
}

class FeaturedItemCard extends StatelessWidget {
  const FeaturedItemCard({
    super.key,
    required this.image,
    required this.press,
  });

  final String image;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: const EdgeInsets.only(
          left: tDefaultPadding,
          top: tDefaultPadding / 2,
          bottom: tDefaultPadding / 2,
        ),
        width: size.width * 0.8,
        height: 185,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: FittedBox(
          fit: BoxFit.cover,
          child: Image(
            image: AssetImage(image),
          ),
        ),
      ),
    );
  }
}
