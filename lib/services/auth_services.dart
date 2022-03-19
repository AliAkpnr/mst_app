import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mst_app/entities/user.dart';
import 'package:mst_app/models/login_model.dart';
import 'package:mst_app/models/register_model.dart';

import 'base.dart';

class AuthService {
  static String _controllerUrl = Base.apiUrl + "auth/";

  static Future<User> login(LoginModel loginModel) async {
    var uri = Uri.parse(_controllerUrl + "login");

    var response = await http.post(uri,
        body: jsonEncode(loginModel.toJson()),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        });
    return User.fromJson(jsonDecode(response.body));
  }

  static Future<User> register(RegisterModel registerModel) async {
    var uri = Uri.parse(_controllerUrl + "register");

    var response = await http.post(uri,
        body: jsonEncode(registerModel.toJson()),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        });
    return User.fromJson(jsonDecode(response.body));
  }
}
