import 'dart:convert';
import 'dart:io';

import 'package:mst_app/entities/product.dart';
import 'package:http/http.dart' as http;

import 'base.dart';

class ProductsService {
  static String _controllerUrl = Base.apiUrl + "products/";

  static Future<List<Product>> getAll() async {
    var uri = Uri.parse(_controllerUrl + "getall");

    var response = await http.get(uri);
    if (response != null) {
      return Product.fromJsonList(response.body);
    }
  }

  static Future<void> add(Product product) async {
    var uri = Uri.parse(_controllerUrl + "add");

    var response = await http.post(uri,
        body: jsonEncode(product.toJson()),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        });
    print(response.statusCode);
  }
}
