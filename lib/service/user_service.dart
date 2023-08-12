import 'package:dio/dio.dart';
import 'package:flutter_application_1/models/user_model.dart';

class UserService {
  String url = "https://jsonplaceholder.typicode.com/todos";
  Future<List<UserModel>> getUser() async {
    List<UserModel> todosList = [];
    final response = await Dio().get(url);
    var data = response.data;
    data.forEach(
      (element) {
        UserModel todo = UserModel.fromJson(element);
        todosList.add(todo);
      },
    );
    return todosList;
  }
}
