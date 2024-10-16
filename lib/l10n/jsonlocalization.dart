
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class JsonLocalizations {

  final Locale locale;
  JsonLocalizations(this.locale);


  static JsonLocalizations? of(BuildContext context) {
    return Localizations.of<JsonLocalizations>(context, JsonLocalizations);
  }


  Map<String,List<Map<String,String>>>? _localizedString;

  Future<bool> load() async {
    String jsonString = await rootBundle.loadString("assets/jsons/${locale.languageCode}.json");
    final dynamic decodedJson = jsonDecode(jsonString);

    if (decodedJson is Map<String, dynamic>) {
      _localizedString = decodedJson.map((key, value) {
        if (value is List<dynamic>) {
          final List<Map<String, String>> mappedList = List<Map<String, String>>.from(value
              .map((item) => item is Map<String, dynamic>
              ? Map<String, String>.from(item)
              : <String, String>{}));
          return MapEntry(key, mappedList);
        }
        return MapEntry(key, [{}]);
      });
    }

    return true;
  }


  translate(String topLevelKey, String nestedKey,int index) {
    if (_localizedString == null) {
      return nestedKey; // Return the key itself if data is not loaded
    }
    List<Map<String, String>>? topLevelMap = _localizedString![topLevelKey];

    return topLevelMap![index][nestedKey];
  }



  static const LocalizationsDelegate<JsonLocalizations> delegate =
  _JsonLocalizationsDelegate();


}

class _JsonLocalizationsDelegate extends LocalizationsDelegate<JsonLocalizations> {

  const _JsonLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ["en","ru"].contains(locale.languageCode);
  }

  @override
  Future<JsonLocalizations> load(Locale locale) async {
    JsonLocalizations jsonLocalizations = JsonLocalizations(locale);
    await jsonLocalizations.load();
    return jsonLocalizations;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<JsonLocalizations> old) {
    return false;
  }

}