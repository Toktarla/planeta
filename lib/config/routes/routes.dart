import 'package:flutter/material.dart';
import 'package:untitled/features/domain/entities/nasa_article_entity.dart';
import 'package:untitled/features/domain/entities/planet_entity.dart';
import 'package:untitled/features/presentation/pages/features/features_page.dart';
import 'package:untitled/features/presentation/pages/features/people_in_space_page.dart';
import 'package:untitled/features/presentation/pages/planet/planet_explanation_page.dart';
import 'package:untitled/features/presentation/pages/practice/planets_gallery.dart';
import 'package:untitled/features/presentation/pages/settings/donation_page.dart';
import 'package:untitled/features/presentation/pages/features/save_nasa_article_page.dart';
import 'package:untitled/features/presentation/pages/practice/planet_quiz_page.dart';
import '../../core/errors/error_page.dart';
import '../../features/presentation/pages/features/apod_image_page.dart';
import '../../features/presentation/pages/home/bottom_navigation.dart';
import '../../features/presentation/pages/planet/favourite_planets_page.dart';
import '../../features/presentation/pages/practice/learn_planets_page.dart';
import '../../features/presentation/pages/practice/practice_planets_page.dart';
import '../../features/presentation/pages/settings/about_page.dart';
import '../../features/presentation/pages/features/nasa_article_detail.page.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute( FeaturesPage());

      case '/NasaArticleDetails':
        return _materialRoute(NasaArticleDetailsViewPage(article: settings.arguments as NasaArticleEntity));

      case '/SavedNasaArticlesPage':
        return _materialRoute(const SavedNasaArticlesPage());

      case '/AboutPage':
        return _materialRoute(const AboutPage());
      case '/DonationPage':
        return _materialRoute(const DonationPage());
      case '/FavouritePlanetsPage':
        return _materialRoute(const FavouritePlanetsPage());
      case '/ErrorPage':
        return _materialRoute( ErrorPage());
      case '/BottomNavigation':
        return _materialRoute(const BottomNavigation());
      case '/PlanetExplanationPage':
        return _materialRoute( PlanetExplanationPage(planetEntity: settings.arguments as PlanetEntity,));
      case '/ApodImagePage':
        return _materialRoute( ApodImagePage());
      case '/LearnPlanetsPage':
        return _materialRoute( LearnPlanetsPage());
      case '/PracticePlanetsPage':
        return _materialRoute( PracticePlanetsPage());
      case '/PlanetQuizPage':
        return _materialRoute( PlanetQuizPage(indexOfQuiz: settings.arguments as int,questions: settings.arguments as dynamic, quizTitle: settings.arguments as String,language: settings.arguments as String,));
      case '/PeopleInSpacePage':
        return _materialRoute(PeopleInSpacePage());
      case "/PrimaryPlanetsGallery":
        return _materialRoute(PrimaryPlanetsGallery(title: settings.arguments as String,indexOfTitle: settings.arguments as int, imageTitles: [],));
      default:
        return _materialRoute( ErrorPage());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view,
    );
  }
}