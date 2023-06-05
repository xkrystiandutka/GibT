import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../constants/sizes.dart';
import '../../models/user.dart';
import '../../theme/colors.dart';

class ItemImage extends StatelessWidget {
  const ItemImage({
    super.key,
    required this.size,
    required this.image,
    this.arrowOffset = const Offset(10, 30),
    required this.user, // Offset to adjust the arrow position
  });

  final String image;
  final Size size;
  final Offset arrowOffset;
  final User user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: tDefaultPadding * 3),
      child: SizedBox(
        height: size.height * 0.75,
        child: Stack(
          children: <Widget>[
            Container(
              height: size.height * 0.75,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 2,
                    color: user.themeColor.withOpacity(0.15),
                  ),
                ],
                image: DecorationImage(
                  alignment: Alignment.center,
                  fit: BoxFit.cover,
                  image: AssetImage(image),
                ),
              ),
            ),
            Positioned(
              top: arrowOffset.dy,
              left: arrowOffset.dx,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black.withOpacity(0.15),
                    ),
                    padding: const EdgeInsets.all(0.2),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        LineAwesomeIcons.angle_left,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
