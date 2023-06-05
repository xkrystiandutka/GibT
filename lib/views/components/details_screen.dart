import 'package:flutter/material.dart';

import '../../models/user.dart';
import '../store_details/details_body.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DetailsBody(
        image: image,
        title: title,
        description: description,
        price: price,
        user: user,
      ),
    );
  }
}
