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
      body: Container(
        width: 412,
        height: 892,
        color: Colors.amber,
      ),
    );
  }
}
