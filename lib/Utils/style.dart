import 'dart:ui';

import 'package:flutter/material.dart';

import 'assets.dart';

Color primaryColor = const Color(0xff1D1D1D);
Color greyColor = const Color(0xffCFCFCF);
Color dangerColor = const Color(0xffFF2121);
Color accentColor = const Color(0xff7ACD6D);
Color inactiveColor = const Color(0xffD9D9D9);
Color subTextColor = const Color(0xff999999);
Color bottomBackColor = const Color(0xffD5E8CA);
Color monthBackGroundColor = const Color(0xffA0C49D);
Color linearGreen = const Color(0xffB9EF9A);
Color alertMessage = const Color(0xffD3FEAB);
Color formBorderColor = const Color(0xffC4C4C4);
Color indicatorColor = const Color(0xffC5C5C5);
Color tabBackColor = const Color(0xffE8E8E8);
Color profileBackColor = const Color(0xffFFD66E);
Color profileSubTitleColor = const Color(0xff1D1D1D80);
Color assignWorkColor = const Color(0xffB5B5B5);
Color textColor = const Color(0xff696969);
Color noDataTextColor = const Color(0xffB5B5B5);
Color screenBackColor = const Color(0xffF5F5F5);
Color checkBackColor = const Color(0xff10B981);
Color textGreyColor = const Color(0xff696969);
Color greenBackgroundColor = const Color(0xff10B981);
Color litePinkBackGround=const Color(0xffF5F5F5);
Color bottomSheetEditTextColor=const Color(0xffF5F5F5);
Color accountBlackColor = const Color(0xff000000);
Color borderColor = const Color(0xffD5D5D5);

///basic colors
Color whiteColor = Colors.white;
Color blackColor = Colors.black;
Color fontLiteColor=const Color.fromARGB(29, 29, 29, 1);
Color tickImageColor=const Color.fromARGB(250, 1, 185, 87);

Color systemNavigationBottomColor=Colors.black;



//rgba(16,185,129,255)


TextStyle appTextStyle(
    {double? fontSize, Color color = Colors.black, FontWeight? fontWeight}) {
  return TextStyle(
    overflow: TextOverflow.ellipsis,
    fontSize: fontSize,
    color: color,
    fontWeight: fontWeight,
  );
}

TextStyle appBarTextStyle({double avg=100,Color? color=Colors.black}) => TextStyle(
  fontFamily: localFontFamily,
  overflow: TextOverflow.ellipsis,
  fontWeight: FontWeight.w500,
  fontStyle:FontStyle.normal ,
  color:color ,
  fontSize: avg * 0.10 / 3,
);

///steps to label screen text styles
TextStyle topTitleTextStyle({double avg=100}) => TextStyle(
  fontFamily: "montreal",
  overflow: TextOverflow.ellipsis,
  fontSize: avg * 0.07 / 2,
);

TextStyle headingTextStyle({Color colors = Colors.black,required double avg}) => TextStyle(
  color: colors,
  fontFamily: "montreal",
  overflow: TextOverflow.ellipsis,
  fontSize: avg * 0.03,
);

TextStyle subHeadingTextStyle({Color colors = Colors.black,required double avg}) => TextStyle(
  color: colors,
  fontFamily: "montreal",
  overflow: TextOverflow.ellipsis,
  fontSize: avg * 0.05/2.1,
);

