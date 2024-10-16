import 'dart:convert';
import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:untitled/features/data/models/planet_model.dart';
import 'package:untitled/features/domain/entities/planet_entity.dart';

void main() {
  const testPlanetModel = PlanetModel(
      name: "Mars",
      description: "The Red Planet",
      image_url: "https://example.com/mars.jpg",
      planetType: "Terrestrial",
      explanation: "Mars is the fourth planet from the Sun.",
      whatis: "It is a potential future habitat for humanity."
  );

  test(
    'should be a subclass of PlanetEntity',
        () async {
      // assert
      expect(testPlanetModel, isA<PlanetEntity>());
    },
  );

  test(
    'should return a valid model from JSON',
        () async {
      // arrange
      final String jsonString = await File('test/helpers/dummy_data/dummy_planet_response.json').readAsString();
      final Map<String, dynamic> jsonMap = json.decode(jsonString);

      // act
      final result = PlanetModel.fromJson(jsonMap);

      // assert
      expect(result, equals(testPlanetModel));
    },
  );

  test(
    'should return a JSON map containing the proper data',
        () async {
      // act
      final result = testPlanetModel.toJson();

      // assert
      final expectedMap = {
        'name': "Mars",
        'description': "The Red Planet",
        'image_url': "https://example.com/mars.jpg",
        'planetType': "Terrestrial",
        'explanation': "Mars is the fourth planet from the Sun.",
        'whatis': "It is a potential future habitat for humanity."
      };

      expect(result, equals(expectedMap));
    },
  );
}
