import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_api_app/constants/global_colors.dart';
import 'package:store_api_app/models/categories_model.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final catergoriesModel = Provider.of<CategoriesModel>(context);
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            width: double.infinity,
            catergoriesModel.image!,
            fit: BoxFit.fill,
            height: size.height * 0.2,
          ),
        ),
        Center(
          child: Text(
            catergoriesModel.name!,
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
