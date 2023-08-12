import 'package:flutter/material.dart';

class Page3 extends StatefulWidget {
  const Page3({super.key});

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(1),
            width: 543.93121,
            height: 599.83105,
            color: Color(0xFF0D4C92),
          ),
          Center(
            child: Container(
              // width: 500,
              child: Text('page3'),
            ),
          ),
        ],
      ),
    );
  }
}
