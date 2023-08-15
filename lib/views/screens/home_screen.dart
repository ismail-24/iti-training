import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/screens/page1.dart';
import 'package:flutter_application_1/views/screens/page2.dart';
import 'package:flutter_application_1/views/screens/page3.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home_screen extends StatefulWidget {
  String email;

  Home_screen({super.key, required this.email});

  @override
  State<Home_screen> createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {
  int currentIndex = 0;
  List<Widget> pages = [
    Page1(),
    Page2(),
    Page3(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'welcom to our library',
            style: TextStyle(
              fontFamily: 'Pacifico',
            ),
          ),
        ),
        backgroundColor: Color(0xff7ea9b5),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: pages[currentIndex],
      // body: Center(
      //   child: Text(
      //     widget.email,
      //   ),
      // ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.checklist,
              ),
              label: "Tasks"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
              ),
              label: "Settings")
        ],
        onTap: (value) {
          currentIndex = value;
          setState(() {});
          print(value);
        },
      ),
    );
  }
}
