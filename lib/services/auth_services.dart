import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mst_app/entities/user.dart';
import 'package:mst_app/models/login_model.dart';
import 'package:mst_app/models/register_model.dart';

import 'base.dart';

class AuthService {
  static String _controllerUrl =
      Base.apiUrl + "auth/"; // http://192.168.1.21:81/api/auth/

  static Future<User> login(LoginModel loginModel) async {
    var uri = Uri.parse(
        _controllerUrl + "login"); // http://192.168.1.21:81/api/auth/login

    var response = await http.post(
        uri, //kullanıcı adı ve şifre ile kullanıcı bilgisi getirilir
        body: jsonEncode(loginModel.toJson()),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        });
    return User.fromJson(
        jsonDecode(response.body)); // kullanıcı var ise kullanıcıyı dönderir
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
