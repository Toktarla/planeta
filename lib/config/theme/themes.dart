import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';


class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.cyanColor,
    fontFamily: 'Roboto',
    iconTheme: IconThemeData(
      color: AppColors.cyanColor,

    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
      displayMedium: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
      displaySmall: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),
      headlineLarge: TextStyle(

      ),
      headlineMedium: TextStyle(color: Colors.white),
      headlineSmall: TextStyle(color: Colors.white),
      titleLarge: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
      titleMedium: TextStyle(
        color: Colors.black87,
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
      titleSmall: TextStyle(
        color: Colors.black87,
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),
      bodyLarge: TextStyle(
          color: Colors.blueGrey,
          fontSize: 20,
          fontWeight: FontWeight.bold
      ),
      bodyMedium: TextStyle(
        color: Colors.blueGrey,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
      bodySmall: TextStyle(
          color: Colors.blueGrey,
          fontSize: 12,
          fontWeight: FontWeight.bold
      ),
      labelLarge: TextStyle(color: Colors.white),
      labelSmall: TextStyle(
          color: Colors.black87,
          fontSize: 12,
          fontWeight: FontWeight.w500
      ),
      labelMedium: TextStyle(),

    ),
    appBarTheme: AppBarTheme(
      color: AppColors.cyanColor,
      elevation: 5,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.whiteColor,
        unselectedItemColor: AppColors.unSelectedBottomBarColorLight,
        selectedItemColor: AppColors.cyanColor

    ),
    datePickerTheme: DatePickerThemeData(
      elevation: 0,
      backgroundColor: AppColors.whiteColor,
      dividerColor: Colors.greenAccent,
      headerBackgroundColor: AppColors.cyanColor,
    ),
    expansionTileTheme: ExpansionTileThemeData(
      iconColor: AppColors.cyanColor,
    ),
    primaryIconTheme: IconThemeData(
      color: AppColors.blueColor,
    ),
    scaffoldBackgroundColor: AppColors.whiteColor,
    cardColor: AppColors.whiteColor,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: Colors.black12
      )
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.brightWhiteColor,
      elevation: 0,
    )
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.blackColor,
    fontFamily: 'Roboto',
    primaryIconTheme: IconThemeData(
      color: AppColors.whiteColor,
    ),
    expansionTileTheme: ExpansionTileThemeData(
      iconColor: AppColors.whiteColor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.blackColor,
        unselectedItemColor: AppColors.unSelectedBottomBarColorDark,
        selectedItemColor: AppColors.whiteColor
    ),
    iconTheme: IconThemeData(
      color: AppColors.whiteColor,
    ),
    appBarTheme: AppBarTheme(
      color: AppColors.blackColor,
      elevation: 5,
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
      displayMedium: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
      displaySmall: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),
      titleLarge: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
      titleMedium: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
      titleSmall: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),
      bodyLarge: TextStyle(
          color: AppColors.pinkColor,
          fontSize: 20,
          fontWeight: FontWeight.bold
      ),
      bodyMedium: TextStyle(
        color: AppColors.pinkColor,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
      bodySmall: TextStyle(
          color: AppColors.pinkColor,
          fontSize: 12,
          fontWeight: FontWeight.bold
      ),
      labelLarge: TextStyle(color: Colors.white),
      labelSmall: TextStyle(
          color: AppColors.pinkColor,
          fontSize: 12,
          fontWeight: FontWeight.w500
      ),
      labelMedium: TextStyle(),

    ),
    cardColor: AppColors.blackColor,
    scaffoldBackgroundColor: AppColors.blackColor.withOpacity(0.8),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: Colors.black12
        )
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.darkBlackColor,
      elevation: 0,
    )
  );
}