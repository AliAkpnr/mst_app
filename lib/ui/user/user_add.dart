import 'package:flutter/material.dart';
import 'package:mst_app/entities/user.dart';
import 'package:mst_app/services/user_services.dart';
import 'package:mst_app/ui/home_page.dart';

class UserAdd extends StatefulWidget {
  UserAdd({Key key}) : super(key: key);

  @override
  State<UserAdd> createState() => _UserAddState();
}

class _UserAddState extends State<UserAdd> {
  TextEditingController nameController = TextEditingController(text: "dene");
  TextEditingController emailController =
      TextEditingController(text: "dene@d.com");
  TextEditingController passController = TextEditingController(text: "123");
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
            controller: emailController,
          ),
          TextField(
            controller: passController,
          ),
          RaisedButton(
            child: Text("Kaydet"),
            onPressed: () {
              var user = User(
                email: emailController.text,
                fullName: nameController.text,
                password: passController.text,
              );

              UserService.add(user).then((value) {
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
