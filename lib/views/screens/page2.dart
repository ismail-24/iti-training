import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/user_model.dart';
import 'package:flutter_application_1/service/user_service.dart';
import 'package:flutter_application_1/views/cubit/todo_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
      create: (context) => TodoCubit(),
      child: BlocConsumer<TodoCubit, TodoState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is UsersLoding) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is UsersError) {
            return Center(
              child: Text('Error'),
            );
          }
          return ListView.builder(
            itemCount: context.watch<TodoCubit>().toDoList.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: ListTile(
                  title: Text('user ' +
                      context
                          .watch<TodoCubit>()
                          .toDoList[index]
                          .userId
                          .toString()),
                  subtitle: Text(
                      "Todo ${context.watch<TodoCubit>().toDoList[index].id}: ${context.watch<TodoCubit>().toDoList[index].title}"),
                  trailing: Text(
                    context.watch<TodoCubit>().toDoList[index].completed == true
                        ? 'Completed'
                        : 'Incomplete',
                    style: TextStyle(
                      color: context
                                  .watch<TodoCubit>()
                                  .toDoList[index]
                                  .completed ==
                              true
                          ? Color.fromARGB(255, 6, 187, 42)
                          : Color.fromARGB(255, 212, 30, 24),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    ));
  }
}
