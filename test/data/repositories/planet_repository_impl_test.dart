import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:untitled/features/data/data_sources/local/app_database.dart';
import 'package:untitled/features/data/models/planet_model.dart';
import 'package:untitled/features/data/repository/planet_repository_impl.dart';
import 'package:untitled/features/domain/entities/planet_entity.dart';
import 'package:untitled/features/domain/repository/planet_repository.dart';

import '../../helpers/test_helper.mocks.dart';



void main() {
  late PlanetRepositoryImpl planetRepository;
  late MockAppDatabase mockAppDatabase;
  late MockPlanetDAO mockPlanetDao;

  setUp(() {
    mockAppDatabase = MockAppDatabase();
    mockPlanetDao = MockPlanetDAO();
    when(mockAppDatabase.planetDAO).thenReturn(mockPlanetDao);

    planetRepository = PlanetRepositoryImpl(mockAppDatabase);
  });

  group('PlanetRepository', () {
    final testPlanetEntity = PlanetEntity(name: "Earth", explanation: "",description: "",image_url: "",planetType: "",whatis: "");
    final testPlanetModel = PlanetModel.fromEntity(testPlanetEntity);

    test('should return list of planets when getSavedPlanets is called', () async {
      // Arrange
      when(mockPlanetDao.getSavedNasaArticles()).thenAnswer((_) async => [testPlanetModel]);
      // Act
      final result = await planetRepository.getSavedNasaArticles();
      // Assert
      expect(result, [testPlanetModel]);
      verify(mockPlanetDao.getSavedNasaArticles());
      verifyNoMoreInteractions(mockPlanetDao);
    });

    test('should call removePlanet on the DAO when removePlanet is called', () async {
      // Arrange
      when(mockPlanetDao.removeNasaArticle(testPlanetModel)).thenAnswer((_) async => null);
      // Act
      await planetRepository.removePlanet(testPlanetEntity);
      // Assert
      verify(mockPlanetDao.removeNasaArticle(testPlanetModel));
      verifyNoMoreInteractions(mockPlanetDao);
    });

    test('should call savePlanet on the DAO when savePlanet is called', () async {
      // Arrange
      when(mockPlanetDao.insertNasaArticle(testPlanetModel)).thenAnswer((_) async => null);
      // Act
      await planetRepository.savePlanet(testPlanetEntity);
      // Assert
      verify(mockPlanetDao.insertNasaArticle(testPlanetModel));
      verifyNoMoreInteractions(mockPlanetDao);
    });
  });
}
