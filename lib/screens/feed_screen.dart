import 'package:flutter/material.dart';

import '../models/products_model.dart';
import '../services/api_handler.dart';
import '../widgets/feed_widget.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({
    super.key,
  });

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  List<ProductsModel> productList = [];
  @override
  void didChangeDependencies() {
    getProducts();
    super.didChangeDependencies();
  }

  Future<void> getProducts() async {
    productList = await ApiHandlers.getAllProducts();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Products'),
      ),
      body: productList.isEmpty
          ? Container()
          : GridView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: productList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                childAspectRatio: 0.6,
              ),
              itemBuilder: (context, index) {
                return FeedWidget(
                  imageUrl: productList[index].images![0],
                  title: productList[index].title.toString(),
                );
              },
            ),
    );
  }
}
