import 'dart:convert';
import 'dart:io';

import 'package:mst_app/entities/categories.dart';
import 'package:http/http.dart' as http;

import 'base.dart';

class CategoriesService {
  static String _controllerUrl = Base.apiUrl + "categories/";

  static Future<List<Categories>> getAll() async {
    var uri = Uri.parse(_controllerUrl + "getall");

    var response = await http.get(uri);
    if (response != null) {
      return Categories.fromJsonList(response.body);
    }
  }

  static Future<void> add(Categories categories) async {
    var uri = Uri.parse(_controllerUrl + "add");

    var response = await http.post(uri,
        body: jsonEncode(categories.toJson()),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        });
    print(response.statusCode);
  }
}
