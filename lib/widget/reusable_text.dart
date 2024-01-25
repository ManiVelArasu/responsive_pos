import 'package:flutter/material.dart';
import 'package:path/path.dart';

class ReusableTextWidget extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight fontWeight;
  final String fontFamily;
  final TextAlign textAlign;
  final TextOverflow overflow;
  final Color? color;
  final FontStyle? fontStyle;
  final double? letterSpacing;
  final String? label;
  final TextStyle? style;

  const ReusableTextWidget({
    super.key,
    required this.text,
    this.fontSize = 14.0,
    this.fontWeight = FontWeight.normal,
    this.fontFamily = 'montreal',
    this.textAlign = TextAlign.start,
    this.overflow = TextOverflow.clip,
    this.color,
    this.fontStyle,
    this.letterSpacing,
    this.label, // You can change this to ellipsis or fade as needed
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: fontFamily,
        fontStyle: fontStyle,
        letterSpacing: letterSpacing,
      ),
      textAlign: textAlign,
      overflow: overflow,
    );
  }
}
