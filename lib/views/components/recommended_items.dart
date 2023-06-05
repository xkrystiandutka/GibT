import 'package:flutter/material.dart';

import '../../constants/sizes.dart';
import '../../models/user.dart';
import '../../theme/colors.dart';
import 'details_screen.dart';

class RecommendedItems extends StatelessWidget {
  RecommendedItems({Key? key, required this.user}) : super(key: key);
  final User user;

  final List<Map<String, dynamic>> recommendedData = [
    {
      'image': "assets/images/store/recommended/gradient.png",
      'title': "Green",
      'description': "Background",
      'price': 30,
    },
    {
      'image': "assets/images/store/recommended/lumpy.png",
      'title': "Lumpy",
      'description': "Avatar",
      'price': 40,
    },
    {
      'image': "assets/images/store/recommended/morty.png",
      'title': "Scared Morty",
      'description': "Avatar",
      'price': 45,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: recommendedData
            .map(
              (item) => RecommendedItemCard(
                image: item['image'],
                title: item['title'],
                description: item['description'],
                price: item['price'],
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsScreen(
                          image: item['image'],
                          title: item['title'],
                          description: item['description'],
                          price: item['price'],
                          user: user),
                    ),
                  );
                },
                user: user,
              ),
            )
            .toList(),
      ),
    );
  }
}

class RecommendedItemCard extends StatelessWidget {
  const RecommendedItemCard({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.price,
    required this.press,
    required this.user,
  });

  final User user;
  final String image, title, description;
  final int price;
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
          bottom: tDefaultPadding * 2.5,
        ),
        width: size.width * 0.4,
        child: Column(
          children: <Widget>[
            SizedBox(
              width: 100,
              height: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image(
                  image: AssetImage(image),
                ),
              ),
            ),
            GestureDetector(
              onTap: press,
              child: Container(
                padding: const EdgeInsets.all(tDefaultPadding / 2),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 10),
                      blurRadius: 40,
                      color: user.themeColor.withOpacity(0.23),
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "$title\n".toUpperCase(),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(fontSize: 10),
                            ),
                            TextSpan(
                              text: description.toUpperCase(),
                              style: TextStyle(
                                color: user.themeColor.withOpacity(0.5),
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                        maxLines: 2, // Set the maximum number of lines
                        overflow: TextOverflow
                            .ellipsis, // Handle overflow with ellipsis
                      ),
                    ),
                    Text(
                      '\$$price',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(color: user.themeColor),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
