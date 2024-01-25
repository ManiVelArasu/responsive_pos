import 'package:flutter/material.dart';



Widget buttonWidget(
    {double? height,
    var width,
    double? textSize,
    double? iconSize,
    double? borderRadiusSize,
    Color? backGroundColor,
    var textColor,
    required String text,
    required Function() clickableFunction,
    IconData? icon,
    Color? iconColor,
    bool? buttonLoading = false}) {
  return SizedBox(
      height: height?.toDouble(),
      width: width?.toDouble(),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            backGroundColor ?? Colors.black,
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                borderRadiusSize?.toDouble() ?? 10,
              ),
            ),
          ),
        ),
        onPressed: () {
          if (buttonLoading == false) {
            clickableFunction();
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buttonLoading == true
                  ? const CircularProgressIndicator()
                  : Text(
                      text,
                      style: TextStyle(
                        fontSize: textSize,
                        fontWeight: FontWeight.w600,
                        fontFamily: "mont",
                        color: textColor,
                      ),
                    ),
              (icon != null)
                  ? const SizedBox(
                      width: 5,
                    )
                  : const SizedBox(),
              (icon != null)
                  ? Icon(
                      icon,
                      color: iconColor,
                      size: iconSize,
                    )
                  : const SizedBox()
            ],
          ),
        ),
      ));
}

class ResponsiveButton extends StatelessWidget {
  final Function() onTap;
  final String title;
  const ResponsiveButton({super.key, required this.onTap, required this.title});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      child: Container(
        height: size.height * 0.08,
        width: size.width * 0.15,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blueAccent,
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                fontSize: (size.height + size.width) / 2 * 0.02,
                color: Colors.white),
          ),
        ),
      ),
    );
  }
}
