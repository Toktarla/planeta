import 'package:dio/dio.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:untitled/core/constants/constants.dart';
import 'package:untitled/features/data/data_sources/remote/nasa_article/nasa_article_api_service.dart';
import 'package:untitled/features/domain/entities/nasa_article_entity.dart';

import '../../../helpers/test_helper.mocks.dart';


void main() {
  late MockDio mockDio;
  late NasaArticleApiService nasaArticleApiService;

  var tApiKey = apodAPIkey;
  const tDate = apodDefaultDate;

  setUp(() {
    mockDio = MockDio();
    when(mockDio.options).thenReturn(BaseOptions());
    nasaArticleApiService = NasaArticleApiService(mockDio);
  });

  test('should return NasaArticleEntity when the call to Dio is successful', () async {
    // Mocked data
    final tNasaArticleData = {
      'title': 'Sample title',
      'hdurl': 'https://example.com/hdurl',
      'date': 'Sample date',
      'copyright': 'Sample copyright',
      'explanation': 'Sample explanation',
    };
    final tNasaArticleEntity = NasaArticleEntity(
      title: tNasaArticleData['title'] ?? "",
      hdurl: tNasaArticleData['hdurl'] ?? "",
      date: tNasaArticleData['date'] ?? "",
      copyright: tNasaArticleData['copyright'] ?? "",
      explanation: tNasaArticleData['explanation'] ?? "",
    );

    // arrange
    when(mockDio.fetch<Map<String, dynamic>>(any)).thenAnswer((_) async => Response<Map<String, dynamic>>(
        data: tNasaArticleData,
        statusCode: 200,
        requestOptions: RequestOptions(path: "")
    ));


    // act
    final result = await nasaArticleApiService.getNasaArticles(api_key: tApiKey, date: tDate);

    // assert
    expect(result.data, equals(tNasaArticleEntity));
  });

  test('should throw an exception when the call to Dio is unsuccessful', () async {
    final tException = DioException(
      requestOptions: RequestOptions(path: 'path'),
      error: 'Something went wrong!',
    );
    // arrange
    when(mockDio.fetch<Map<String, dynamic>>(any)).thenThrow(tException);
    final result = nasaArticleApiService.getNasaArticles(api_key: tApiKey, date: tDate);
    // act & assert
    await expectLater(result,throwsA(isA<DioException>()));

    verify(mockDio.fetch<Map<String, dynamic>>(any));
  });
}
