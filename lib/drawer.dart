import 'package:flutter/material.dart';
import 'package:mst_app/ui/auth/login.dart';
import 'package:mst_app/ui/home_page.dart';
import 'package:mst_app/ui/product/products.dart';

import 'models/page_model.dart';
import 'ui/categories/categories.dart';

// ignore: must_be_immutable
class DrawerMenu extends StatefulWidget {
  DrawerMenuState drawerMenuState;
  @override
  State<StatefulWidget> createState() {
    drawerMenuState = new DrawerMenuState();
    return drawerMenuState;
  }
}

class DrawerMenuState extends State<DrawerMenu> {
  PageModel selected;
  List<PageModel> pageStack;

  DrawerMenuState() {
    pageStack = <PageModel>[];
    selected = PageModel(HomePage(), "Anasayfa");
    pageStack.add(selected);
  }

  changeState(PageModel model) {
    setState(() {
      selected = model;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => (_goBack()),
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text(selected.title),
        ),
        drawer: getDrawer(),
        body: selected.page,
      ),
    );
  }

  Future<bool> _goBack() async {
    if (selected.title != "Anasayfa") {
      changeState(pageStack.removeLast());
      return false;
    } else {
      return (await showDialog(
            context: context,
            builder: (context) => new AlertDialog(
              title: new Text('Dikkat!'),
              content: new Text('Uygulama kapatılsın mı?'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: new Text('Hayır'),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: new Text('Evet'),
                ),
              ],
            ),
          )) ??
          false;
    }
  }

  getDrawer() {
    return new Drawer(
      child: new Column(
        children: <Widget>[
          new UserAccountsDrawerHeader(
            accountName: new Text("Ali Akpınar"),
            accountEmail: new Text("mc@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(
                "M",
                style: TextStyle(fontSize: 40.0),
              ),
            ),
          ),
          getMenuItems(),
        ],
      ),
    );
  }

  getMenuItems() {
    return new Column(children: [
      new ListTile(
        leading: new Icon(Icons.login_outlined),
        title: new Text("Giriş"),
        selected: selected.title == "Giriş",
        onTap: () => onSelectItem(PageModel(Login(), "Giriş")),
      ),
      new ListTile(
        leading: new Icon(Icons.home_outlined),
        title: new Text("Anasayfa"),
        selected: selected.title == "Anasayfa",
        onTap: () => onSelectItem(PageModel(HomePage(), "Anasayfa")),
      ),
      new ListTile(
        leading: new Icon(Icons.apps_outlined),
        title: new Text("Ürünler"),
        selected: selected.title == "Ürünler",
        onTap: () => onSelectItem(PageModel(ProductsPage(), "Ürünler")),
      ),
      new ListTile(
        leading: new Icon(Icons.apps_outlined),
        title: new Text("Kategoriler"),
        selected: selected.title == "Kategoriler",
        onTap: () => onSelectItem(PageModel(CategoriesPage(), "Kategoriler")),
      ),
    ]);
  }

  onSelectItem(PageModel pageModel) {
    if (Navigator.of(context).canPop()) Navigator.of(context).pop();
    pageStack.add(selected);
    changeState(pageModel);
  }
}
