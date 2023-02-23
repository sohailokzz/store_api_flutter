import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_api_app/models/categories_model.dart';
import 'package:store_api_app/widgets/category_widget.dart';

import '../constants/global_colors.dart';
import '../services/api_handler.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
      ),
      body: FutureBuilder<List<CategoriesModel>>(
        future: ApiHandlers.getAllCategories(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: lightIconsColor,
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("An Error accured ${snapshot.error}"),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text("No data added yet"),
            );
          }
          return GridView.builder(
            padding: const EdgeInsets.all(12),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: snapshot.data!.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              childAspectRatio: 1.2,
            ),
            itemBuilder: (context, index) {
              return ChangeNotifierProvider.value(
                value: snapshot.data![index],
                child: const CategoryWidget(),
              );
            },
          );
        },
      ),
    );
  }
}
