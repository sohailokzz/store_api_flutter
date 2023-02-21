import 'package:flutter/material.dart';
import 'package:store_api_app/constants/global_colors.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            width: double.infinity,
            "https://placeimg.com/640/480/any",
            fit: BoxFit.fill,
            height: size.height * 0.2,
          ),
        ),
        Center(
          child: Text(
            'Cate Name',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              backgroundColor: lightCardColor.withOpacity(0.5),
            ),
          ),
        )
      ],
    );
  }
}
