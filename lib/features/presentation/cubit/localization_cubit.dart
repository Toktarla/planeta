import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';



class LocalizationCubit extends Cubit<String> {
  final SharedPreferences _prefs;

  LocalizationCubit(this._prefs) : super('en');

  Future<void> loadLanguage() async {
    final savedLanguage = _prefs.getString('language');
    if (savedLanguage != null) {
      emit(savedLanguage);
    }
  }

  void changeLanguage(String language) {
    _prefs.setString('language', language);
    emit(language);
  }
}