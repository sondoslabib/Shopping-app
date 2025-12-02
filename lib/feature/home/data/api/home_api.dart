import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_app/core/constants/app_apis.dart';
import 'package:shopping_app/core/network/result_api.dart';
import 'package:shopping_app/feature/home/data/models/category_response_dto.dart';
import 'package:shopping_app/feature/home/data/models/product_response_dto.dart';

class HomeApi {
  Future<ResultAPI<List<CategoryResponseDTO>>> getCategories() async {
    try {
      Uri url = Uri.https(AppAPIs.baseURL, AppAPIs.categoriesURL);
      var response = await http.get(url);
      var responseBody = response.body;
      List<dynamic> json = jsonDecode(responseBody);
      List<CategoryResponseDTO> listOfCategories = json
          .map<CategoryResponseDTO>(
            (category) => CategoryResponseDTO.fromJson(category),
          )
          .toList();
      return SuccessAPI<List<CategoryResponseDTO>>(listOfCategories);
    } catch (e) {
      return ErrorAPI<List<CategoryResponseDTO>>(messageError: e.toString());
    }
  }

  Future<ResultAPI<List<ProductResponseDTO>>> getProducts() async {
    try {
      Uri url = Uri.https(AppAPIs.baseURL, AppAPIs.productsURL);
      var response = await http.get(url);
      var responseBody = response.body;
      List<dynamic> json = jsonDecode(responseBody);
      List<ProductResponseDTO> listOfCategories = json
          .map<ProductResponseDTO>(
            (product) => ProductResponseDTO.fromJson(product),
          )
          .toList();
      return SuccessAPI<List<ProductResponseDTO>>(listOfCategories);
    } catch (e) {
      return ErrorAPI<List<ProductResponseDTO>>(messageError: e.toString());
    }
  }
}

HomeApi injectableHomeApi() => HomeApi();
