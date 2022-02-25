import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:sample_app/src/models/get_food_data_response.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

abstract class FoodRepo {
  Future<List<FoodDataResponse>> getFoodList();
}

class FoodServices implements FoodRepo {
  static const baseUrl = "www.mocky.io/v2/";
  static const String dataUrl = "/p68289/screentime";
  @override
  Future<List<FoodDataResponse>> getFoodList() async {
    // TODO: implement getFoodList
    // Uri.parse()
    // final response = await http
    //     .get(Uri.parse('https://www.mocky.io/v2/5dfccffc310000efc8d2c1ad'));
    // final uri = Uri.https(baseUrl, '5dfccffc310000efc8d2c1ad');
    // final response = await http.Client().get(uri);
    // print("Responsee");
    // Map<String, dynamic> json = jsonDecode(response.body);
    // print("JSON BODY");
    // print(json.toString());
    // List<FoodDataResponse> foodList = foodDataResponseFromJson(response.body);
    // print("Food List");
    // print(foodList);


    // Uri uri = Uri.https(baseUrl, dataUrl);
    // Response response = await http.get(uri);
    // print("Food List Response");
    // print(response);
    // List<FoodDataResponse> foodList = foodDataResponseFromJson(response.body);
    // print("Food List");
    // print(foodList);
    // return foodList;

    String url = "https://www.mocky.io/v2/5dfccffc310000efc8d2c1ad";
    final response = await http.get(url);

    var responseData = json.decode(response.body);
    print("Food List");
    print(responseData);
    List<FoodDataResponse> foodData = foodDataResponseFromJson(responseData);
    print(foodData[0].branchName);
    return foodData;
  }
}
