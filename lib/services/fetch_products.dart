import 'dart:convert';

import 'package:furniture_app/models/product.dart';
import 'package:http/http.dart' as http;

Future<List<Product>> fetchProducts() async {
  //3秒后再做请求
  return Future.delayed(Duration(seconds: 4), () async {
    const String apiUrl = "http://192.168.30.39/api/products.json";
    final response = await http.get(apiUrl);
    if (response.statusCode == 200) {
      List<Product> products = (json.decode(response.body) as List)
          .map((data) => Product.fromJson(data))
          .toList();
      return products;
    } else {
      throw Exception("Failed to load");
    }
  });
}
