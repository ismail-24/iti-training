import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/user_model.dart';
import 'package:flutter_application_1/service/user_service.dart';

class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  List<UserModel> toDoList = [];
  bool isLoading = true;

  void getMyUsers() async {
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
        ? Center(child: CircularProgressIndicator())
        : ListView.builder(
            itemCount: toDoList.length,
            itemBuilder: (BuildContext context, int index) {
              final todo = toDoList[index];
              return Card(
                child: ListTile(
                  title: Text('user ' + todo.userId.toString()),
                  subtitle: Text("Todo ${todo.id}: ${todo.title}"),
                  trailing: Text(
                    todo.completed == true ? 'Completed' : 'Incomplete',
                    style: TextStyle(
                      color: todo.completed == true
                          ? Color.fromARGB(255, 6, 187, 42)
                          : Color.fromARGB(255, 212, 30, 24),
                    ),
                  ),
                ),
              );
            },
          );
  }
}
