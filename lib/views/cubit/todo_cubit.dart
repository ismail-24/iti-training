import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../service/user_service.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoInitial()) {
    getMyUsers();
  }

  List<UserModel> toDoList = [];

  getMyUsers() async {
    try {
      emit(UsersLoding());
      toDoList = await UserService().getUser();
      emit(UsersSuccess());
    } catch (e) {
      emit(UsersError());
    }
  }
}
