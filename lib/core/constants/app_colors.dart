import 'package:flutter/material.dart';

class AppColors {

  // Common
  static final Color blackColor = const Color(0xFF1E1B18);
  static final Color whiteColor = Color.fromRGBO(255, 255, 255, 1);


  // SPECIFIC
  static final Color introTitleColor = const Color.fromRGBO(166,110,228, 1.0);

  // DARK
  static Color get blueColor => Color.fromRGBO(38, 3, 117, 1.0);
  static Color get darkBlackColor => Color.fromRGBO(49, 54, 63, 1.0);
  static Color get pinkColor => Color.fromRGBO(250, 234, 235, 0.949);
  static Color get unSelectedBottomBarColorDark => whiteColor.withOpacity(0.7);

  // LIGHT
  static final Color brightWhiteColor = Color.fromRGBO(237, 232, 220,1);
  static final Color cyanColor = Color.fromRGBO(137, 170, 229, 1);
  static final Color unSelectedBottomBarColorLight = Color.fromRGBO(92, 74, 114, 1);
}