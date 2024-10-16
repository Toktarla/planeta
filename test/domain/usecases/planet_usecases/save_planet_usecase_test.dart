import 'package:flutter_test/flutter_test.dart';
import 'package:untitled/features/domain/entities/planet_entity.dart';
import 'package:untitled/features/domain/usecases/planet_usecases/save_planet_usecase.dart';

import '../../../helpers/test_helper.mocks.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';


void main() {
  late SavePlanetUseCase savePlanetUseCase;
  late MockPlanetRepository mockPlanetRepository;

  setUp(() {
    mockPlanetRepository = MockPlanetRepository();
    savePlanetUseCase = SavePlanetUseCase(mockPlanetRepository);
  });

  final tPlanet = PlanetEntity(name: 'Earth');

  test(
    'should save a planet into the repository',
        () async {
      // arrange
      when(mockPlanetRepository.savePlanet(tPlanet))
          .thenAnswer((_) async => Future.value());
      // act
      dynamic result() async => await savePlanetUseCase.call(params: tPlanet);
      // assert
      verifyNever(mockPlanetRepository.savePlanet(tPlanet));
      verifyNoMoreInteractions(mockPlanetRepository);
    },
  );
}
