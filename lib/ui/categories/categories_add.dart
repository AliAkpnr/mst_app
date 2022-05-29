import 'package:flutter/material.dart';
import 'package:mst_app/drawer.dart';
import 'package:mst_app/entities/categories.dart';
import 'package:mst_app/main.dart';
import 'package:mst_app/models/page_model.dart';
import 'package:mst_app/services/categories_services.dart';
import 'package:mst_app/ui/home_page.dart';

import 'categories.dart';

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
  DrawerMenu _drawer = MyApp.getDrawerState();
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
              _drawer.drawerMenuState
                  .onSelectItem(PageModel(CategoriesPage(), "Kategoriler"));
              var idController; //////////////         sil
              var category = Category(
                name: nameController.text,
                id: idController.text,
              );
            },
          ),
        ],
      ),
    );
  }

  Category({String name, id}) {}
}


/*
 CategoriesService.add(categories).then((value) {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => HomePage()),
                  (route) => false,
                );
              });*/