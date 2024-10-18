import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/config/theme/themes.dart';


class ThemeCubit extends Cubit<ThemeData> {
  final SharedPreferences _prefs;

  ThemeCubit(this._prefs) : super(AppThemes.lightTheme);

  ThemeData get theme {
    final isDarkMode = _prefs.getBool('isDarkMode') ?? false;
    return isDarkMode ? AppThemes.darkTheme : AppThemes.lightTheme;
  }

  Future<void> loadTheme() async {
    final isDarkMode = _prefs.getBool('isDarkMode') ?? false;
    emit(isDarkMode ? AppThemes.darkTheme : AppThemes.lightTheme);
  }

  void toggleTheme() {
    final isDarkMode = state.brightness == Brightness.dark;
    _prefs.setBool('isDarkMode', !isDarkMode);
    emit(!isDarkMode ? AppThemes.darkTheme : AppThemes.lightTheme);
  }
}
