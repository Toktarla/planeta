import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:retrofit/dio.dart';
import 'package:untitled/core/constants/constants.dart';
import 'package:untitled/core/resources/data_state.dart';
import 'package:untitled/features/data/data_sources/local/app_database.dart';
import 'package:untitled/features/data/data_sources/remote/nasa_article/nasa_article_api_service.dart';
import 'package:untitled/features/data/models/nasa_article_model.dart';
import 'package:untitled/features/data/repository/nasa_article_repository_impl.dart';
import 'package:untitled/features/domain/entities/nasa_article_entity.dart';
import 'package:untitled/features/domain/repository/nasa_article_repository.dart';

import '../../helpers/test_helper.mocks.dart';


void main() {
  late NasaArticleRepositoryImpl repository;
  late MockNasaArticleApiService mockApiService;
  late MockAppDatabase mockAppDatabase;
  late MockNasaArticleDao mockNasaArticleDAO;

  setUp(() {
    mockApiService = MockNasaArticleApiService();
    mockAppDatabase = MockAppDatabase();
    mockNasaArticleDAO = MockNasaArticleDao();
    when(mockAppDatabase.nasaArticleDAO).thenReturn(mockNasaArticleDAO);
    repository = NasaArticleRepositoryImpl(mockApiService, mockAppDatabase);
  });

  group('getNasaArticles', () {
    final tDate = '2018-01-16';
    const tNasaArticleEntity = NasaArticleEntity(
      explanation: "With image data from telescopes large and small, this close-up features the dusty Elephant's Trunk Nebula. It winds through the emission nebula and young star cluster complex IC 1396, in the high and far off constellation of Cepheus. Also known as vdB 142, the cosmic elephant's trunk is over 20 light-years long. The colorful view highlights bright, swept-back ridges that outline the region's pockets of cool interstellar dust and gas. Such embedded, dark, tendril-shaped clouds contain the raw material for star formation and hide protostars within. Nearly 3,000 light-years distant, the relatively faint IC 1396 complex covers a large region on the sky, spanning over 5 degrees. This dramatic scene spans a 1 degree wide field, about the size of 2 Full Moons.",
      copyright: "Robert Gendler",
      date: "2018-01-16",
      hdurl: "https://apod.nasa.gov/apod/image/1801/VDB142-ESO-L.jpg",
      title: "An Elephant's Trunk in Cepheus",
    );
    final NasaArticleModel tNasaArticleModel = NasaArticleModel.fromEntity(tNasaArticleEntity);

    test('should perform a GET request on a URL with the date being the endpoint and with application/json header', () async {
      // arrange
      when(mockApiService.getNasaArticles(
          api_key: apodAPIkey,
          date: tDate
      )).thenAnswer((_) async => HttpResponse(tNasaArticleEntity,Response(statusCode: 200,requestOptions: RequestOptions())));

      // act
      final result = await repository.getNasaArticles(tDate);

      // assert
      expect(result.data, equals(tNasaArticleEntity));

      verify(mockApiService.getNasaArticles(api_key: apodAPIkey, date: tDate));
      verifyNoMoreInteractions(mockApiService);
    });

  });
  group('getSavedNasaArticles', () {
    final nasaArticleModelList = [
      NasaArticleModel(title: "Astronomy picture"),
      NasaArticleModel(title: "Milky way")
    ];
    final List<NasaArticleEntity> tNasaArticleModelList = nasaArticleModelList;

    test('should return list of saved articles', () async {
      // arrange
      when(mockNasaArticleDAO.getSavedNasaArticles()).thenAnswer((_) async => nasaArticleModelList);

      // act
      final result = await repository.getSavedNasaArticles();

      // assert
      expect(result, equals(tNasaArticleModelList));
    });

  });

  group('removeNasaArticle', () {
    final tNasaArticleModel = NasaArticleModel();
    final NasaArticleEntity tNasaArticleEntity = tNasaArticleModel;

    test('should call AppDatabase to remove the article', () async {
      // arrange
      when(mockNasaArticleDAO.removeNasaArticle(any)).thenAnswer((_) async => null);

      // act
      await repository.removeNasaArticle(tNasaArticleEntity);

      // assert
      verify(mockNasaArticleDAO.removeNasaArticle(tNasaArticleModel));
      verifyNoMoreInteractions(mockNasaArticleDAO);
    });

  });

  group('saveNasaArticle', () {
    final tNasaArticleModel = NasaArticleModel();
    final NasaArticleEntity tNasaArticleEntity = tNasaArticleModel;

    test('should call AppDatabase to save the article', () async {
      // arrange
      when(mockNasaArticleDAO.insertNasaArticle(any)).thenAnswer((_) async => null);

      // act
      await repository.saveNasaArticle(tNasaArticleEntity);

      // assert
      verify(mockNasaArticleDAO.insertNasaArticle(tNasaArticleModel));
      verifyNoMoreInteractions(mockNasaArticleDAO);
    });

  });



}
