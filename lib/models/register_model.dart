import 'dart:convert';

class RegisterModel {
  String fullName;
  String email;
  String password;
  String passwordAgain;

  RegisterModel({this.email, this.password, this.fullName, this.passwordAgain});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['email'] = this.email;
    data['password'] = this.password;
    data['passwordAgain'] = this.passwordAgain;
    data['fullName'] = this.fullName ?? "";

    return data;
  }
}
