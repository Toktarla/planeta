import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:untitled/core/constants/constants.dart';
import 'package:untitled/features/data/data_sources/remote/gallery/gallery_api_service.dart';
import 'package:untitled/features/domain/entities/gallery_entity.dart';

import '../../../helpers/test_helper.mocks.dart';

void main() {
  late MockDio mockDio;
  late GalleryApiService galleryApiService;

  setUp(() {
    mockDio = MockDio();
    when(mockDio.options).thenReturn(BaseOptions());

    galleryApiService = GalleryApiService(mockDio);
  });

  group('getPhotosByQuery', () {
    final tQuery = "space";
    final tPerPage = "10";
    final tClientId = unsplashClientId;

    final tGalleryEntityData = {
        "total": 1000,
        "total_pages": 100,
        "results": [
          {
            "id": "sample_id",
            "description": "A beautiful scenery",
            "alt_description": "Mountains with a clear sky",
            "urls": {
              "raw": "https://example.com/raw.jpg",
              "full": "https://example.com/full.jpg",
              "regular": "https://example.com/regular.jpg",
              "small": "https://example.com/small.jpg",
              "thumb": "https://example.com/thumb.jpg"
            },
            "links": {
              "self": "https://api.example.com/photos/sample_id",
              "html": "https://example.com/photos/sample_id",
              "download": "https://example.com/photos/sample_id/download",
              "download_location": "https://api.example.com/photos/sample_id/download"
            },
            "likes": 45
          }
        ]
    };
    final tGalleryEntity = GalleryEntity.fromJson(tGalleryEntityData);

    test('should return GalleryEntity when the call to Dio is successful', () async {
      // arrange
      when(mockDio.fetch<Map<String, dynamic>>(any))
          .thenAnswer((_) async => Response<Map<String, dynamic>>(data: tGalleryEntityData, statusCode: 200, requestOptions: RequestOptions()));

      // act
      final result = await galleryApiService.getPhotosByQuery(client_id: tClientId, query: tQuery, per_page: tPerPage);

      // assert
      expect(result.data, equals(tGalleryEntity));
      verify(mockDio.fetch<Map<String, dynamic>>(any));
    });

    test('should throw an exception when the call to Dio is unsuccessful', () async {
      final tException = DioException(
        requestOptions: RequestOptions(path: 'path'),
        error: 'Something went wrong!',
      );
      // arrange
      when(mockDio.fetch<Map<String, dynamic>>(any)).thenThrow(tException);

      // act
      final call = galleryApiService.getPhotosByQuery(client_id: tClientId, query: tQuery, per_page: tPerPage);

      // assert
      await expectLater(call, throwsA(isInstanceOf<DioException>()));
      verify(mockDio.fetch<Map<String, dynamic>>(any));
    });
  });
}
