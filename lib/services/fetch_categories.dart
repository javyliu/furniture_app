import 'dart:convert';

import 'package:furniture_app/models/category.dart';
import 'package:http/http.dart' as http;


Future<List<Category>> fetchCategories() async {
  const String apiUrl = "http://192.168.30.39/api/categories.json";

  final response = await http.get(apiUrl);

  if(response.statusCode == 200){
    List<Category> categories = (json.decode(response.body) as List).map((e) => Category.fromJson(e)).toList();
    return categories;

  }else{
    throw Exception("Failed to load");
  }
}