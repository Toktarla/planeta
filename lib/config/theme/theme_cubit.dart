import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/core/constants/constants.dart';

import '../../core/constants/app_colors.dart';

class ThemeCubit extends Cubit<ThemeData> {
  final SharedPreferences _prefs;

  ThemeCubit(this._prefs) : super(_lightTheme);

  ThemeData get theme {
    final isDarkMode = _prefs.getBool('isDarkMode') ?? false;
    return isDarkMode ? _darkTheme : _lightTheme;
  }

  static final ThemeData _lightTheme = ThemeData(
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

  );

  static final ThemeData _darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.blueColor,
    fontFamily: 'Roboto',



    primaryIconTheme: IconThemeData(
      color: AppColors.whiteColor,
    ),
    expansionTileTheme: ExpansionTileThemeData(
      iconColor: AppColors.whiteColor,
    ),
    datePickerTheme: DatePickerThemeData(

    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.darkBlueColor,
      unselectedItemColor: AppColors.unSelectedBottomBarColorDark,
      selectedItemColor: AppColors.pinkColor

    ),
    iconTheme: IconThemeData(
      color: AppColors.whiteColor,
    ),
    appBarTheme: AppBarTheme(
      color: AppColors.darkBlueColor,
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
    cardColor: AppColors.blueColor,
    scaffoldBackgroundColor: AppColors.darkBlueColor,

  );

  Future<void> loadTheme() async {
    final isDarkMode = _prefs.getBool('isDarkMode') ?? false;
    emit(isDarkMode ? _darkTheme : _lightTheme);
  }

  void toggleTheme() {
    final isDarkMode = state.brightness == Brightness.dark;
    _prefs.setBool('isDarkMode', !isDarkMode);
    emit(!isDarkMode ? _darkTheme : _lightTheme);
  }
}
