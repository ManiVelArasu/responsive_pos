import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IconTextContainer extends StatelessWidget {
  final double width;
  final double height;
  final double borderWidth;
  final IconData iconData;
  final String text;

  const IconTextContainer({
    Key? key,
    required this.width,
    required this.height,
    required this.borderWidth,
    required this.iconData,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;

    return Container(
      width: width,
      height: height * height,
      margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
      decoration: BoxDecoration(
        border: Border.all(
          width: borderWidth,
          // Add borderColor property to IconTextData class
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            iconData,
            size: (height * 0.065 + width) / 2 * 0.030 / 2,
          ),
          Text(
            text,
            style: TextStyle(
              color: Colors.black,
              fontSize: (height * 0.065 + width) / 2 * 0.030 / 2,
            ),
          ),
        ],
      ),
    );
  }
}