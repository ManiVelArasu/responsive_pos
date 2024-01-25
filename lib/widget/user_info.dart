import 'package:flutter/cupertino.dart';

class ReusableContainer extends StatelessWidget {
  final double width;
  final Color? color;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Widget? child;
  final BoxDecoration? decoration;

  ReusableContainer({
    required this.width,
    this.color,
    this.margin,
    this.padding,
    this.child,
    this.decoration,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: decoration,
      margin: margin,
      padding: padding,
      child: child,
      height: height,
    );
  }
}
