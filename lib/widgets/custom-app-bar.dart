import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 24,
          height: 24,
          child: Container(
            width: 24,
            height: 24,
            child: Icon(
              Icons.arrow_back,
              color: Color(0xFF072AC8),
            ),
          ),
        ),
        const SizedBox(width: 264),
        Text(
          'Skip',
          style: TextStyle(
            color: Color(0xFF072AC8),
            fontSize: 15,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            height: 0,
          ),
        ),
      ],
    );
  }
}
