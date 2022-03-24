import 'dart:convert';

class Categories {
  int id;
  String Name;

  Categories({this.id, this.Name});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    Name = json['Name'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id ?? "0";
    data['Name'] = this.Name ?? "";
    return data;
  }

  static List<Categories> fromJsonList(String str) {
    return List<Categories>.from(
        json.decode(str).map((x) => Categories.fromJson(x)));
  }
}
