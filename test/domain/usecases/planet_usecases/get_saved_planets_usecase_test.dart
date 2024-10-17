import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:untitled/features/domain/entities/planet_entity.dart';
import 'package:untitled/features/domain/usecases/planet_usecases/get_saved_planets_usecase.dart';
import '../../../helpers/test_helper.mocks.dart';

void main() {
  late GetSavedPlanetsUseCase getSavedPlanetsUseCase;
  late MockPlanetRepository mockPlanetRepository;

  setUp(() {
    mockPlanetRepository = MockPlanetRepository();
    getSavedPlanetsUseCase = GetSavedPlanetsUseCase(mockPlanetRepository);
  });

  final tPlanets = [
    PlanetEntity(name: 'Mercury'),
    PlanetEntity(name: 'Venus'),
    PlanetEntity(name: 'Earth'),
  ];

  test(
    'should get a list of saved planets from the repository',
        () async {
      // arrange
      when(mockPlanetRepository.getSavedNasaArticles())
          .thenAnswer((_) async => tPlanets);
      // act
      final result = await getSavedPlanetsUseCase.call(params: tPlanets);
      // assert
      expect(result, equals(tPlanets));
      verify(mockPlanetRepository.getSavedNasaArticles());
      verifyNoMoreInteractions(mockPlanetRepository);
    },
  );
}