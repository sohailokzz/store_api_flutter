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
  final ScrollController _scrollController = ScrollController();
  List<ProductsModel> productList = [];

  int limit = 10;
  bool _isLoading = false;

  @override
  void initState() {
    getProducts();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // getProducts();
    _scrollController.addListener(() async {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _isLoading = true;

        limit += 10;
        await getProducts();
        _isLoading = false;
      }
    });
    super.didChangeDependencies();
  }

  Future<void> getProducts() async {
    productList = await ApiHandlers.getAllProducts(
      limit: limit.toString(),
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // elevation: 4,
        title: const Text('All Products'),
      ),
      body: productList.isEmpty
          ? Center(
              child: CircularProgressIndicator(
                color: lightIconsColor,
              ),
            )
          : SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: productList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8.0,
                        mainAxisSpacing: 8.0,
                        childAspectRatio: 0.6,
                      ),
                      itemBuilder: (ctx, index) {
                        return ChangeNotifierProvider.value(
                          value: productList[index],
                          child: const FeedWidget(),
                        );
                      }),
                  if (_isLoading)
                    Center(
                      child: CircularProgressIndicator(
                        color: lightIconsColor,
                      ),
                    ),
                ],
              ),
            ),
    );
  }
}
