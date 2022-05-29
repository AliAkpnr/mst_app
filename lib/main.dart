import 'package:flutter/material.dart';
import 'package:mst_app/ui/auth/login.dart';

import 'drawer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final DrawerMenu _drawer = DrawerMenu();
  static DrawerMenu getDrawerState() {
    return _drawer;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _drawer,
    );
  }
}
