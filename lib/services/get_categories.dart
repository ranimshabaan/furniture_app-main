import 'dart:convert';
import 'package:furniture_app/models/categories.dart';
import 'package:http/http.dart' as http;

class GetCategories {
  Future<List<CategoriesModel>> getGategories() async {
    http.Response response = await http.get(Uri.parse(
        'https://5f210aa9daa42f001666535e.mockapi.io/api/categories'));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<CategoriesModel> categoriesList = data
          .map((json) => CategoriesModel.fromjson(json))
          .toList();
      return categoriesList;
    } else {
      throw Exception('there is error ${response.statusCode}');
    }
  }
}
