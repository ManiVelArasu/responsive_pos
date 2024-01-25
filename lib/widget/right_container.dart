import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BuildTextFieldContainer extends StatelessWidget {
  final double width;
  final double height;
  final IconTextData iconTextData;

  const BuildTextFieldContainer({
    Key? key,
    required this.width,
    required this.height,
    required this.iconTextData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double borderWidth = (height + width) / 2 * 0.001;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: size.width*0.09,
          padding: const EdgeInsets.symmetric(vertical:3,horizontal: 3 ),
          margin: EdgeInsets.symmetric(
            horizontal: width * 0.01,
            vertical: height * 0.01,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              width: borderWidth,
              color: iconTextData.borderColor ?? Colors.black, // Add borderColor property to IconTextData class
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                iconTextData.icon,
                size: (height * 0.065 + size.width) / 2 * 0.050 / 2,
              ),
              SizedBox(height: height * 0.005),
              Text(
                iconTextData.text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: (height * 0.065 + size.width) /2* 0.030 / 2,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class IconTextData {
  final IconData icon;
  final String text;
  final Color? borderColor;

  IconTextData({
    required this.icon,
    required this.text,
    this.borderColor,
  });
}