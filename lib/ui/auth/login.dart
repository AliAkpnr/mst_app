import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:mst_app/models/login_model.dart';
import 'package:mst_app/models/register_model.dart';
import 'package:mst_app/services/auth_services.dart';
import 'package:mst_app/ui/home_page.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController nameController = TextEditingController();
  bool ctrl = false;
  LoginData registerData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ctrl ? nameScreen() : loginScreen(),
    );
  }

  loginScreen() {
    return FlutterLogin(
      onRecoverPassword: (value) {
        return null;
      },
      onSignup: (loginData) {
        setState(() {
          registerData = loginData;
          ctrl = true;
        });
        return null;
      },
      onLogin: (loginData) async {
        return await login(loginData);
      },
    );
  }

  nameScreen() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text("Ad Soyad"),
          TextField(
            controller: nameController,
          ),
          RaisedButton(
            child: Text("KAYDET"),
            onPressed: () {
              register();
            },
          ),
        ],
      ),
    );
  }

  login(LoginData loginData) async {
    var loginModel =
        LoginModel(email: loginData.name, password: loginData.password);
    var response = await AuthService.login(loginModel);
    if (response != null) {
      print(response.toJson());
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => HomePage(),
        ),
      );
    }
    return null;
  }

  register() async {
    var registerModel = RegisterModel(
        email: registerData.name,
        password: registerData.password,
        passwordAgain: registerData.password,
        fullName: nameController.text);
    var response = await AuthService.register(registerModel);
    if (response != null) {
      print(response.toJson());
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => HomePage(),
        ),
      );
    }
    return null;
  }
}
