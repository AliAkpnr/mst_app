import 'package:flutter/material.dart';
import 'package:mst_app/drawer.dart';
import 'package:mst_app/entities/product.dart';
import 'package:mst_app/main.dart';
import 'package:mst_app/models/page_model.dart';
import 'package:mst_app/services/product_services.dart';
import 'package:mst_app/ui/product/products.dart';

class ProductAdd extends StatefulWidget {
  ProductAdd({Key key}) : super(key: key);

  @override
  State<ProductAdd> createState() => _ProductAddState();
}

class _ProductAddState extends State<ProductAdd> {
  TextEditingController nameController = TextEditingController(text: "dene");
  TextEditingController emailController =
      TextEditingController(text: "dene@d.com");
  TextEditingController passController = TextEditingController(text: "123");
  DrawerMenu _drawer = MyApp.getDrawerState();
  get idController => null; ////////// sil
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: nameController,
        ),
        TextField(
          controller: idController,
        ),
        // ignore: deprecated_member_use
        RaisedButton(
          child: Text("Kaydet"),
          onPressed: () {
            _drawer.drawerMenuState
                .onSelectItem(PageModel(ProductsPage(), "Ürunler"));
            var idController; //////////////         sil
            var product = Product(
              name: nameController.text,
              id: idController.text,
            );

            // ProductsService.add(product).then((value) {
            //   _drawer.drawerMenuState
            //       .onSelectItem(PageModel(ProductsPage(), "Ürunler"));
            // });
          },
        ),
      ],
    );
  }
}
