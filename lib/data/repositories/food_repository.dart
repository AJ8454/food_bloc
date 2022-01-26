import 'dart:convert';

import 'package:food_bloc/data/models/food_models.dart';
import 'package:http/http.dart' as http;

abstract class FoodRepository {
  Future<List<Recipe>> getFoods();
}

class FoodRepositoryImpl extends FoodRepository {
  @override
  Future<List<Recipe>> getFoods() async {
    var response = await http.get(
        Uri.parse("https://forkify-api.herokuapp.com/api/search?q=pizza#"));

    if (response.statusCode == 200) {
      var data = json.decode(response.body);

      List<Recipe> recipes = Food.fromJson(data).recipes!;
      return recipes;
    } else {
      throw Exception("Failed to get data");
    }
  }
}
