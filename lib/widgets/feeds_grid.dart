import 'package:flutter/material.dart';

import '../models/products_model.dart';
import 'feed_widget.dart';

class FeedsGridWidget extends StatelessWidget {
  const FeedsGridWidget({Key? key, required this.productsList})
      : super(key: key);
  final List<ProductsModel> productsList;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: productsList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        childAspectRatio: 0.6,
      ),
      itemBuilder: (ctx, index) {
        return FeedWidget(
          imageUrl: productsList[index].images![0],
          title: productsList[index].title.toString(),
        );
      },
    );
  }
}
