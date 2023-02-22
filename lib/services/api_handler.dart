import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:store_api_app/constants/api_constants.dart';
import 'package:store_api_app/models/categories_model.dart';
import 'package:store_api_app/models/products_model.dart';

class ApiHandlers {
  static Future<List<dynamic>> getData({
    required String target,
  }) async {
    var myuri = Uri.https(BASE_URL, 'api/v1/$target');
    var response = await http.get(
      myuri,
    );
    // log('Json respnse: ${response.body}');
    var data = jsonDecode(response.body);

    List tempList = [];

    for (var v in data) {
      tempList.add(v);
    }
    return tempList;
  }

  static Future<List<ProductsModel>> getAllProducts() async {
    List tempProductList = await getData(
      target: 'products',
    );
    return ProductsModel.productsFromSnapshot(
      tempProductList,
    );
  }

  static Future<List<CategoriesModel>> getAllCategories() async {
    List tempCategoriesList = await getData(
      target: 'categories',
    );
    return CategoriesModel.categoriesFromSnapshot(
      tempCategoriesList,
    );
  }
}
