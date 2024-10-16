// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Hello World!`
  String get helloWorld {
    return Intl.message(
      'Hello World!',
      name: 'helloWorld',
      desc: '',
      args: [],
    );
  }

  /// `Planets`
  String get bottomBarTitle1 {
    return Intl.message(
      'Planets',
      name: 'bottomBarTitle1',
      desc: '',
      args: [],
    );
  }

  /// `Practice`
  String get bottomBarTitle2 {
    return Intl.message(
      'Practice',
      name: 'bottomBarTitle2',
      desc: '',
      args: [],
    );
  }

  /// `Features`
  String get bottomBarTitle3 {
    return Intl.message(
      'Features',
      name: 'bottomBarTitle3',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get bottomBarTitle4 {
    return Intl.message(
      'Settings',
      name: 'bottomBarTitle4',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get settings_page_item1 {
    return Intl.message(
      'Language',
      name: 'settings_page_item1',
      desc: '',
      args: [],
    );
  }

  /// `About app`
  String get settings_page_item2 {
    return Intl.message(
      'About app',
      name: 'settings_page_item2',
      desc: '',
      args: [],
    );
  }

  /// `Share`
  String get settings_page_item3 {
    return Intl.message(
      'Share',
      name: 'settings_page_item3',
      desc: '',
      args: [],
    );
  }

  /// `Rate app`
  String get settings_page_item4 {
    return Intl.message(
      'Rate app',
      name: 'settings_page_item4',
      desc: '',
      args: [],
    );
  }

  /// `Donation`
  String get settings_page_item5 {
    return Intl.message(
      'Donation',
      name: 'settings_page_item5',
      desc: '',
      args: [],
    );
  }

  /// `Feedback`
  String get feed_back {
    return Intl.message(
      'Feedback',
      name: 'feed_back',
      desc: '',
      args: [],
    );
  }

  /// `Feedback channel (Telegram)`
  String get feed_back_telegram {
    return Intl.message(
      'Feedback channel (Telegram)',
      name: 'feed_back_telegram',
      desc: '',
      args: [],
    );
  }

  /// `You can write with one of the condition below: \n•Recommendation\n•Errors`
  String get feed_back_telegram_description {
    return Intl.message(
      'You can write with one of the condition below: \n•Recommendation\n•Errors',
      name: 'feed_back_telegram_description',
      desc: '',
      args: [],
    );
  }

  /// `Day`
  String get day {
    return Intl.message(
      'Day',
      name: 'day',
      desc: '',
      args: [],
    );
  }

  /// `Night`
  String get night {
    return Intl.message(
      'Night',
      name: 'night',
      desc: '',
      args: [],
    );
  }

  /// `Planeta`
  String get app_name {
    return Intl.message(
      'Planeta',
      name: 'app_name',
      desc: '',
      args: [],
    );
  }

  /// `1.0 version`
  String get version {
    return Intl.message(
      '1.0 version',
      name: 'version',
      desc: '',
      args: [],
    );
  }

  /// `Planeta app idea's taken from this website:`
  String get app_idea_taken {
    return Intl.message(
      'Planeta app idea\'s taken from this website:',
      name: 'app_idea_taken',
      desc: '',
      args: [],
    );
  }

  /// `https://play.google.com/store/apps/details?id=com.galaxy.starmap`
  String get app_idea_taken_url {
    return Intl.message(
      'https://play.google.com/store/apps/details?id=com.galaxy.starmap',
      name: 'app_idea_taken_url',
      desc: '',
      args: [],
    );
  }

  /// `Astronomy Picture of your Day`
  String get feature1_name {
    return Intl.message(
      'Astronomy Picture of your Day',
      name: 'feature1_name',
      desc: '',
      args: [],
    );
  }

  /// `People in space right now`
  String get feature2_name {
    return Intl.message(
      'People in space right now',
      name: 'feature2_name',
      desc: '',
      args: [],
    );
  }

  /// `You can know how many people are in space right now?`
  String get feature2_description {
    return Intl.message(
      'You can know how many people are in space right now?',
      name: 'feature2_description',
      desc: '',
      args: [],
    );
  }

  /// `Find out what space was like on your birthday`
  String get feature1_description {
    return Intl.message(
      'Find out what space was like on your birthday',
      name: 'feature1_description',
      desc: '',
      args: [],
    );
  }

  /// `Practice makes perfect! Here, you can test yourself and learn something new about our fascinating solar system. Explore the planets, test your knowledge, and dive into the wonders of space. Whether you're a beginner or a space enthusiast, there's always something new to discover. Learn and practice with our interactive quizzes and educational resources`
  String get introduction_text_practice_page {
    return Intl.message(
      'Practice makes perfect! Here, you can test yourself and learn something new about our fascinating solar system. Explore the planets, test your knowledge, and dive into the wonders of space. Whether you\'re a beginner or a space enthusiast, there\'s always something new to discover. Learn and practice with our interactive quizzes and educational resources',
      name: 'introduction_text_practice_page',
      desc: '',
      args: [],
    );
  }

  /// `Learn Planets`
  String get learn_planets {
    return Intl.message(
      'Learn Planets',
      name: 'learn_planets',
      desc: '',
      args: [],
    );
  }

  /// `Practice Planets`
  String get practice_planets {
    return Intl.message(
      'Practice Planets',
      name: 'practice_planets',
      desc: '',
      args: [],
    );
  }

  /// `Primary Planets`
  String get primary_planets {
    return Intl.message(
      'Primary Planets',
      name: 'primary_planets',
      desc: '',
      args: [],
    );
  }

  /// `Dwarf Planets`
  String get dwarf_planets {
    return Intl.message(
      'Dwarf Planets',
      name: 'dwarf_planets',
      desc: '',
      args: [],
    );
  }

  /// `Hypothetical Planets`
  String get hypothetical_planets {
    return Intl.message(
      'Hypothetical Planets',
      name: 'hypothetical_planets',
      desc: '',
      args: [],
    );
  }

  /// `Exoplanets`
  String get exoplanets {
    return Intl.message(
      'Exoplanets',
      name: 'exoplanets',
      desc: '',
      args: [],
    );
  }

  /// `Earth and Moon`
  String get earth_and_moon {
    return Intl.message(
      'Earth and Moon',
      name: 'earth_and_moon',
      desc: '',
      args: [],
    );
  }

  /// `Planet Images`
  String get guess_planet {
    return Intl.message(
      'Planet Images',
      name: 'guess_planet',
      desc: '',
      args: [],
    );
  }

  /// `Project Support❤`
  String get donation_page_text1 {
    return Intl.message(
      'Project Support❤',
      name: 'donation_page_text1',
      desc: '',
      args: [],
    );
  }

  /// `You can send payment in any amount to the details below, thank you!`
  String get donation_page_text2 {
    return Intl.message(
      'You can send payment in any amount to the details below, thank you!',
      name: 'donation_page_text2',
      desc: '',
      args: [],
    );
  }

  /// `The details above can be copied by clicking on them`
  String get donation_page_text3 {
    return Intl.message(
      'The details above can be copied by clicking on them',
      name: 'donation_page_text3',
      desc: '',
      args: [],
    );
  }

  /// `Thanks donations!`
  String get donation_page_text4 {
    return Intl.message(
      'Thanks donations!',
      name: 'donation_page_text4',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
