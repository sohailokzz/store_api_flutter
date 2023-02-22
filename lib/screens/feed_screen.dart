import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_api_app/constants/global_colors.dart';

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
          ? Center(
              child: CircularProgressIndicator(
                color: lightIconsColor,
              ),
            )
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
                return ChangeNotifierProvider.value(
                  value: productList[index],
                  child: const FeedWidget(),
                );
              },
            ),
    );
  }
}
