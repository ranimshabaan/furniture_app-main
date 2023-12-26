import 'dart:convert';

import 'package:furniture_app/models/products.dart';
import 'package:http/http.dart' as http;

class GetProducts {
  Future<List<ProductsModel>> getProducts() async {
    http.Response response = await http.get(await Uri.parse(
        'https://5f210aa9daa42f001666535e.mockapi.io/api/products'));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<ProductsModel> ProductsList =
          data.map((json) => ProductsModel.fromjson(json)).toList();
      return ProductsList;
    } else {
      throw Exception('there is error ${response.statusCode}');
    }
  }
}
