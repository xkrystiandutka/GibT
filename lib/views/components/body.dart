import 'package:flutter/material.dart';
import 'package:gibt_app/models/user.dart';

import '../../constants/sizes.dart';
import 'featured_items.dart';
import 'header_with_searchbar.dart';
import 'secondary_header.dart';
import 'recommended_items.dart';

class Body extends StatelessWidget {
  const Body({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    // Total height and width of the screen
    Size size = MediaQuery.of(context).size;
    // This will enable scrolling on small devices
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          HeaderWithSearchBox(size: size, user: user),
          TitleWithMoreBtn(title: "Recommended", user: user, press: () {}),
          RecommendedItems(
            user: user,
          ),
          TitleWithMoreBtn(title: "Featured Avatars", user: user, press: () {}),
          const FeaturedItems(),
          const SizedBox(height: tDefaultPadding),
        ],
      ),
    );
  }
}
