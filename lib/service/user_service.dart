import 'package:dio/dio.dart';
import 'package:flutter_application_1/models/user_model.dart';

class UserService {
  String url = "https://jsonplaceholder.typicode.com/users";
  Future<List<UserModel>> getUser() async {
    List<UserModel> usersList = [];
    final response = await Dio().get(url);
    var data = response.data;
    data.forEach(
      (element) {
        UserModel user = UserModel.fromJson(element);
        usersList.add(user);
      },
    );
    return usersList;
  }
}
