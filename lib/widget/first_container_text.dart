import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TwoTextsRow extends StatelessWidget {
  final String firstText;
  final String secondText;

   TwoTextsRow({super.key, required this.firstText, required this.secondText});

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return Container(
      padding:  EdgeInsets.symmetric(horizontal:size.width*0.006,vertical: size.height*0.004),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            firstText,
            style: TextStyle(fontSize: (height * 0.065 +
                width*0.9) /
                2 *
                0.030 /
                2, color: Colors.black),
          ),
          Text(
            secondText,
            style: TextStyle(fontSize: (height * 0.065 +
                width*0.9) /
                2 *
                0.030 /
                2, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
