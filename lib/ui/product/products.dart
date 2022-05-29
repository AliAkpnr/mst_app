import 'package:flutter/material.dart';
import 'package:mst_app/drawer.dart';
import 'package:mst_app/entities/product.dart';
import 'package:mst_app/main.dart';
import 'package:mst_app/models/page_model.dart';
import 'package:mst_app/services/product_services.dart';
import 'package:mst_app/ui/product/product_add.dart';

class ProductsPage extends StatefulWidget {
  ProductsPage({Key key}) : super(key: key);

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  DrawerMenu _drawer = MyApp.getDrawerState();
  List<Product> products = [];
  @override
  void initState() {
    ProductsService.getAll().then((data) {
      setState(() {
        products = data;
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
                .onSelectItem(PageModel(ProductAdd(), "Ürün Ekle"));
          },
        ),
        Expanded(
          child: Container(
            child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: products.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: Text(products[index].id.toString()),
                    title: Text(products[index].name),
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
