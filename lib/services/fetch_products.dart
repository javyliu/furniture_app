import 'dart:convert';

import 'package:furniture_app/models/product.dart';
import 'package:http/http.dart' as http;


Future<List<Product>> fetchProducts() async {
  const String apiUrl = "http://192.168.30.39/api/products";
  final response = await http.get(apiUrl);

  if(response.statusCode == 200){
    List<Product> products = (json.decode(response.body) as List).map((data) => Product.fromJson(data)).toList();
    return products;
  }else{
    throw Exception("Failed to load");
  }

}