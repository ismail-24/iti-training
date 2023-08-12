import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/user_model.dart';
import 'package:flutter_application_1/service/user_service.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  List<UserModel> toDoList = [];
  bool isLoading = true;

  getMyUsers() async {
    toDoList = await UserService().getUser();
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
            itemCount: toDoList.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(
                  "user " +
                      toDoList[index].userId.toString() +
                      "\n todo number " +
                      toDoList[index].id.toString(),
                ),
                subtitle: Text(
                  toDoList[index].title ?? "--",
                  style: TextStyle(
                    color: toDoList[index].completed == true
                        ? Color.fromARGB(255, 6, 187, 42)
                        : Color.fromARGB(255, 212, 30, 24),
                  ),
                ),
                trailing: Icon(
                  toDoList[index].completed == true ? Icons.done : Icons.close,
                  color: toDoList[index].completed! ? Colors.green : Colors.red,
                ),
                // leading: Text("${index + 1}"),
              );
            },
          );
  }
}
