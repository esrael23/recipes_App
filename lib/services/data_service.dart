import 'package:recepies_app/models/recipe.dart';
import 'package:recepies_app/services/http_service.dart';

import '../models/user.dart';

class DataService {
  static final DataService _singleton = DataService._internal();
  final HttpService _httpService = HttpService();
  User? user;

  factory DataService() {
    return _singleton;
  }

  DataService._internal();
  Future<List<Recipe>?> getRecipes(String filter
      // String username, String password
      ) async {
    String path = "recipes/";
    if (filter.isNotEmpty) {
      path += "meal-type/$filter";
    }
    var respone = await _httpService.get(path);

    if (respone?.statusCode == 200 && respone?.data != null) {
      print(respone!.data);
      List data = respone!.data["recipes"];
      List<Recipe> recipes = data.map((e) => Recipe.fromJson(e)).toList();
      print(recipes);
      return recipes;
    }
    //   try {
    //     var response = await _httpService
    //         .post("recipes", {"username": username, "password": password});
    //     if (response?.statusCode == 200 && response?.data != null) {
    //       // print(response!.data);
    //       user = User.fromJson(response!.data);
    //       HttpService().setup(bearerToken: user!.token);
    //       return true;
    //       // print(user);
    //     }
    //   } catch (e) {
    //     print(e);
    //   }
    //   return false;
  }

  String path = "recipes/";
}
