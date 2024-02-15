import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Constants {
  static const double inkwellWidth = 185;

  static const double cardHeight = 250;

  static calculateFontSize(int size) {
    if (ScreenUtil().orientation == Orientation.portrait) {
      return size.sp;
    } else {
      return (size * 1.5).sp;
    }
  }

  final textfieldBorder = const OutlineInputBorder(
      borderSide: BorderSide(width: 2, color: Color(0xFF321432)));

  final appbarsTextStyle = const TextStyle(
      fontFamily: 'Lumanosimo', color: Colors.white, fontSize: 25);

  static const darkPurpleColor = Color(0xFF321432);

  static const greyColor = Color.fromARGB(255, 230, 227, 227);
}
