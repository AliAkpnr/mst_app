import 'dart:convert';

class Product {
  int id;
  String name;

  Product({this.id, this.name});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id ?? "0";
    data['name'] = this.name ?? "";
    return data;
  }

  static List<Product> fromJsonList(String str) {
    return List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));
  }
}
