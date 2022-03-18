import 'dart:convert';

class User {
  int id;
  String email;
  String password;
  String fullName;

  User({this.id, this.email, this.password, this.fullName});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    password = json['password'];
    fullName = json['fullName'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id ?? "0";
    data['email'] = this.email;
    data['password'] = this.password;
    data['fullName'] = this.fullName;
    return data;
  }

  static List<User> fromJsonList(String str) {
    return List<User>.from(json.decode(str).map((x) => User.fromJson(x)));
  }
}
