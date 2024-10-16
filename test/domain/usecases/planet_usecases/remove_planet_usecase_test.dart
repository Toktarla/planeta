import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:untitled/core/exceptions/exceptions.dart';
import 'package:untitled/features/domain/entities/planet_entity.dart';
import 'package:untitled/features/domain/usecases/planet_usecases/remove_planet_usecase.dart';
import '../../../helpers/test_helper.mocks.dart';

void main() {
  late RemovePlanetUseCase removePlanetUseCase;
  late MockPlanetRepository mockPlanetRepository;

  setUp(() {
    mockPlanetRepository = MockPlanetRepository();
    removePlanetUseCase = RemovePlanetUseCase(mockPlanetRepository);
  });

  final tPlanet = PlanetEntity(name: 'Earth');

  test(
    'should remove a planet from the repository',
        () async {
      // arrange
      when(mockPlanetRepository.removePlanet(tPlanet))
          .thenAnswer((_) async => Future.value());
      // act
      await removePlanetUseCase.call(params: tPlanet);
      // assert

      verify(mockPlanetRepository.removePlanet(tPlanet)).called(1);
      verifyNoMoreInteractions(mockPlanetRepository);
    },
  );

  test(
    'should remove a planet from the repository',
        () async {
      // arrange
      when(mockPlanetRepository.removePlanet(tPlanet))
          .thenAnswer((_) async => Future.value());
      // act
      await removePlanetUseCase.call(params: tPlanet);
      // assert

      verify(mockPlanetRepository.removePlanet(tPlanet)).called(1);
      verifyNoMoreInteractions(mockPlanetRepository);
    },
  );


}