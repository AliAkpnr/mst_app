import 'dart:convert';

import 'package:mst_app/entities/user.dart';
import 'package:http/http.dart' as http;

import 'base.dart';

class UserService {
  static String _controllerUrl = Base.apiUrl + "users/";

  static Future<List<User>> getAll() async {
    var uri = Uri.parse(_controllerUrl + "getall");

    var response = await http.get(uri);
    if (response != null) {
      return User.fromJsonList(response.body);
    }
  }

  static Future<void> add(User user) async {
    var uri = Uri.parse(_controllerUrl + "add");

    var response = await http.post(uri,
        body: jsonEncode(user.toJson()),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        });
    print(response.statusCode);
  }
}
