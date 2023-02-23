import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:store_api_app/constants/api_constants.dart';
import 'package:store_api_app/models/categories_model.dart';
import 'package:store_api_app/models/products_model.dart';
import 'package:store_api_app/models/users_model.dart';

class ApiHandlers {
  static Future<List<dynamic>> getData({
    required String target,
    String? limit,
  }) async {
    try {
      var myuri = Uri.https(
        BASE_URL,
        'api/v1/$target',
        target == 'products'
            ? {
                "offset": "0",
                "limit": limit,
              }
            : {},
      );
      var response = await http.get(
        myuri,
      );
      // log('Json respnse: ${response.body}');
      var data = jsonDecode(response.body);

      List tempList = [];
      if (response.statusCode != 200) {
        throw data['message'];
      }

      for (var v in data) {
        tempList.add(v);
      }
      return tempList;
    } catch (error) {
      throw error.toString();
    }
  }

  static Future<List<ProductsModel>> getAllProducts({
    required String limit,
  }) async {
    List tempProductList = await getData(
      target: 'products',
      limit: limit,
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

  static Future<List<UsersModel>> getAllUsers() async {
    List tempUserList = await getData(
      target: 'users',
    );
    return UsersModel.usersFromSnapshot(
      tempUserList,
    );
  }

  static Future<ProductsModel> getProductDetails({
    required String id,
  }) async {
    try {
      var myuri = Uri.https(BASE_URL, 'api/v1/products/$id');
      var response = await http.get(
        myuri,
      );

      var data = jsonDecode(response.body);
      if (response.statusCode != 200) {
        throw data['message'];
      }

      return ProductsModel.fromJson(data);
    } catch (error) {
      throw error.toString();
    }
  }
}
