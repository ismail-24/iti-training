import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back,
          color: Color(0xFF072AC8),
        ),
        title: const Align(
          alignment: Alignment.centerRight,
          child: Text(
            'Skip',
            style: TextStyle(
              color: Color(0xFF072AC8),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 650,
            left: 320,
            child: Container(
              padding: const EdgeInsets.only(top: 11, left: 11),
              width: 155,
              height: 153,
              decoration: const ShapeDecoration(
                shape: OvalBorder(
                  side: BorderSide(
                    width: 1,
                    strokeAlign: BorderSide.strokeAlignOutside,
                    color: Color(0xFFFF9209),
                  ),
                ),
              ),
              child: Container(
                width: 146,
                height: 146,
                decoration: const ShapeDecoration(
                  color: Color(0xFF072AC8),
                  shape: OvalBorder(),
                ),
                padding: const EdgeInsets.only(top: 50, left: 30),
                child: const Text(
                  'Next',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
