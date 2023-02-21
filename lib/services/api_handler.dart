import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:store_api_app/constants/api_constants.dart';
import 'package:store_api_app/models/products_model.dart';

class ApiHandlers {
  static Future<List<ProductsModel>> getAllProducts() async {
    var myuri = Uri.https(BASE_URL, 'api/v1/products');
    var response = await http.get(
      myuri,
    );
    // log('Json respnse: ${response.body}');
    var data = jsonDecode(response.body);

    List tempProductList = [];

    for (var v in data) {
      tempProductList.add(v);
    }
    return ProductsModel.productsFromSnapshot(tempProductList);
  }
}
