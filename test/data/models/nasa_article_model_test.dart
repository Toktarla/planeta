import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:untitled/features/data/models/nasa_article_model.dart';
import 'package:untitled/features/domain/entities/nasa_article_entity.dart';

import '../../helpers/json_reader.dart';

void main() {
  const testNasaArticleModel = NasaArticleModel(
    title: 'Arp 87: Merging Galaxies from Hubble',
    explanation: 'This dance is to the death.  As these two large galaxies duel, a cosmic bridge of stars, gas, and dust currently stretches over 75,000 light-years and joins them.  The bridge itself is strong evidence that these two immense star systems have passed close to each other and experienced violent tides induced by mutual gravity. As further evidence, the face-on spiral galaxy on the right, also known as NGC 3808A, exhibits many young blue star clusters produced in a burst of star formation. The twisted edge-on spiral on the left (NGC 3808B) seems to be wrapped in the material bridging the galaxies and surrounded by a curious polar ring. Together, the system is known as Arp 87. While such interactions are drawn out over billions of years, repeated close passages will ultimately create one merged galaxy. Although this scenario does look unusual, galactic mergers are thought to be common, with Arp 87 representing a stage in this inevitable process. The Arp 87 dancing pair are about 300 million light-years distant toward the constellation of the Lion (Leo). The prominent edge-on spiral galaxy at the far left appears to be a more distant background galaxy and not involved in the on-going merger.',
    date: '2023-10-24',
    hdurl: "https://apod.nasa.gov/apod/image/2310/Arp87_HubblePathak_2512.jpg",
    copyright: "",
  );

  test(
    'should be a subclass of NasaArticleEntity',
        () async {
      expect(testNasaArticleModel, isA<NasaArticleEntity>());
    },
  );

  test(
    'should return a valid model from json',
        () async {
      // arrange
      final String jsonString = await readJson('test/helpers/dummy_data/dummy_nasa_article_response.json');
      final Map<String, dynamic> jsonMap = json.decode(jsonString);

      // act
      final result = NasaArticleModel.fromJson(jsonMap);

      // assert
      expect(result, equals(testNasaArticleModel));
    },
  );

  test(
    'should return a json map containing proper data',
        () async {
      // act
      final result = testNasaArticleModel.toJson();

      // assert
      final expectedJsonMap = {
        'title': 'Arp 87: Merging Galaxies from Hubble',
        'hdurl': "https://apod.nasa.gov/apod/image/2310/Arp87_HubblePathak_2512.jpg",
        'date': '2023-10-24',
        'explanation': 'This dance is to the death.  As these two large galaxies duel, a cosmic bridge of stars, gas, and dust currently stretches over 75,000 light-years and joins them.  The bridge itself is strong evidence that these two immense star systems have passed close to each other and experienced violent tides induced by mutual gravity. As further evidence, the face-on spiral galaxy on the right, also known as NGC 3808A, exhibits many young blue star clusters produced in a burst of star formation. The twisted edge-on spiral on the left (NGC 3808B) seems to be wrapped in the material bridging the galaxies and surrounded by a curious polar ring. Together, the system is known as Arp 87. While such interactions are drawn out over billions of years, repeated close passages will ultimately create one merged galaxy. Although this scenario does look unusual, galactic mergers are thought to be common, with Arp 87 representing a stage in this inevitable process. The Arp 87 dancing pair are about 300 million light-years distant toward the constellation of the Lion (Leo). The prominent edge-on spiral galaxy at the far left appears to be a more distant background galaxy and not involved in the on-going merger.',
        'copyright': '',
      };

      expect(result, equals(expectedJsonMap));
    },
  );
}
