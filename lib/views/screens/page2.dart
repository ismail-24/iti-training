import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/user_model.dart';
import 'package:flutter_application_1/service/user_service.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  List<UserModel> users = [];
  bool isLoading = true;

  getMyUsers() async {
    users = await UserService().getUser();
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getMyUsers();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            itemCount: users.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(users[index].name ?? "--"),
                subtitle: Text(users[index].email ?? "--"),
                trailing: Icon(Icons.person),
                leading: Text("${index + 1}"),
              );
            },
          );
  }
}
