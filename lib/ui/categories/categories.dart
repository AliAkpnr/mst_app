import 'package:flutter/material.dart';
import 'package:mst_app/drawer.dart';
import 'package:mst_app/entities/categories.dart';
import 'package:mst_app/entities/product.dart';
import 'package:mst_app/main.dart';
import 'package:mst_app/models/page_model.dart';
import 'package:mst_app/services/categories_services.dart';
import 'package:mst_app/ui/categories/categories_add.dart';

class CategoriesPage extends StatefulWidget {
  CategoriesPage({Key key}) : super(key: key);

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  DrawerMenu _drawer = MyApp.getDrawerState();
  List<Categories> categories = [];
  @override
  void initState() {
    CategoriesService.getAll().then((data) {
      setState(() {
        categories = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RaisedButton(
          child: Text("Ekle"),
          onPressed: () {
            _drawer.drawerMenuState
                .onSelectItem(PageModel(CategoriesAdd(), "Kategori Ekle"));
          },
        ),
        Expanded(
          child: Container(
            child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: categories.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: Text(categories[index].id.toString()),
                    title: Text(categories[index].Name),
                  );
                }),
          ),
        ),
      ],
    );
  }
}

/*
_drawer.drawerMenuState
                    .onSelectItem(PageModel(ProductsPage(), "Ürunler"));
 */
