import 'package:flutter/material.dart';
import 'package:mst_app/entities/categories.dart';
import 'package:mst_app/services/categories_services.dart';
import 'package:mst_app/ui/home_page.dart';

class CategoriesAdd extends StatefulWidget {
  CategoriesAdd({Key key}) : super(key: key);

  @override
  State<CategoriesAdd> createState() => _CategoriesAddState();
}

class _CategoriesAddState extends State<CategoriesAdd> {
  TextEditingController nameController = TextEditingController(text: "dene");
  TextEditingController emailController =
      TextEditingController(text: "dene@d.com");
  TextEditingController passController = TextEditingController(text: "123");

  get idController => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(
            controller: nameController,
          ),
          TextField(
            controller: idController,
          ),
          RaisedButton(
            child: Text("Kaydet"),
            onPressed: () {
              var idController;
              var categories = Categories(
                Name: nameController.text,
                id: idController.text,
              );

              CategoriesService.add(categories).then((value) {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => HomePage()),
                  (route) => false,
                );
              });
            },
          ),
        ],
      ),
    );
  }
}
