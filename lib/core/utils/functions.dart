import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppFunctions {
  static String translateToRussian(String englishText) {
    switch (englishText) {
      case "Mercury":
        return "Меркурий";
      case "Venus":
        return "Венера";
      case "Earth":
        return "Земля";
      case "Mars":
        return "Марс";
      case "Jupiter":
        return "Юпитер";
      case "Saturn":
        return "Сатурн";
      case "Uranus":
        return "Уран";
      case "Neptune":
        return "Нептун";
      case "TRAPPIST":
        return "Траппист";
      case "Osiris":
        return "Осирис";
      case "Haumea":
        return "Хаумеа";
      case "Eris":
        return "Эрис";
      case "Ceres":
        return "Церес";
      case "Pluto":
        return "Плутон";
      default:
        return "Unknown planet";
    }
  }

  static String translateToEnglish(String russianText) {
    switch (russianText) {
      case "Меркурий":
        return "Mercury";
      case "Венера":
        return "Venus";
      case "Земля":
        return "Earth";
      case "Марс":
        return "Mars";
      case "Юпитер":
        return "Jupiter";
      case "Сатурн":
        return "Saturn";
      case "Уран":
        return "Uranus";
      case "Нептун":
        return "Neptune";
      case "Траппист":
        return "TRAPPIST";
      case "Осирис":
        return "Osiris";
      case "Хаумеа":
        return "Haumea";
      case "Эрис":
        return "Eris";
      case "Церес":
        return "Ceres";
      case "Плутон":
        return "Pluto";
      default:
        return "Unknown planet";
    }
  }

  static String extractFromImagePathPlanetName(String path) {
    final pattern = RegExp(r'images\/(.*?)_icon');
    final match = pattern.firstMatch(path);
    if (match != null && match.groupCount >= 1) {
      return match.group(1)!;
    }
    return '';
  }

  static List<String> readQuizTitles(BuildContext context) {
    return [
      AppLocalizations.of(context)!.primary_planets,
      AppLocalizations.of(context)!.dwarf_planets,
      AppLocalizations.of(context)!.hypothetical_planets,
      AppLocalizations.of(context)!.exoplanets,
      AppLocalizations.of(context)!.earth_and_moon,
      AppLocalizations.of(context)!.guess_planet,
    ];
  }
}