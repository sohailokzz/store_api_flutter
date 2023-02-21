import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:page_transition/page_transition.dart';

import '../constants/global_colors.dart';
import '../screens/details_screen.dart';

class FeedWidget extends StatelessWidget {
  final String title, imageUrl;

  const FeedWidget({
    super.key,
    required this.title,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Material(
      borderRadius: BorderRadius.circular(8.0),
      color: Theme.of(context).cardColor,
      child: InkWell(
        borderRadius: BorderRadius.circular(8.0),
        onTap: () {
          Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.fade,
              child: const ProductDetails(),
            ),
          );
        },
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5, top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: RichText(
                      text: TextSpan(
                          text: '\$',
                          style: const TextStyle(
                              color: Color.fromRGBO(33, 150, 243, 1)),
                          children: <TextSpan>[
                            TextSpan(
                              text: "168.00",
                              style: TextStyle(
                                color: lightTextColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ]),
                    ),
                  ),
                  const Icon(IconlyBold.heart),
                ],
              ),
            ),
            const SizedBox(height: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                width: double.infinity,
                imageUrl,
                fit: BoxFit.fill,
                height: size.height * 0.2,
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
          ],
        ),
      ),
    );
  }
}
