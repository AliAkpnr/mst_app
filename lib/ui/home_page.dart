import 'package:flutter/material.dart';
import 'package:mst_app/entities/user.dart';
import 'package:mst_app/services/user_services.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<User> users;

  @override
  void initState() {
    super.initState();
    UserService.getAll().then((value) {
      setState(() {
        users = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return users == null
        ? Center(child: CircularProgressIndicator())
        : ListView.builder(
            itemCount: users.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(users[index].fullName),
                subtitle: Text(users[index].email),
              );
            },
          );
  }
}
