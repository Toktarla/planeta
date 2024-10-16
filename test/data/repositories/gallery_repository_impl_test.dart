import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:untitled/core/constants/constants.dart';
import 'package:untitled/core/resources/data_state.dart';
import 'package:untitled/features/data/data_sources/remote/gallery/gallery_api_service.dart';
import 'package:untitled/features/data/repository/gallery_repository_impl.dart';
import 'package:untitled/features/domain/entities/gallery_entity.dart';
import 'package:untitled/features/domain/repository/gallery_repository.dart';
import 'package:retrofit/retrofit.dart';
import '../../helpers/test_helper.mocks.dart';


@GenerateMocks([GalleryApiService])
void main() {
  late GalleryRepositoryImpl repository;
  late MockGalleryApiService mockGalleryApiService;

  setUp(() {
    mockGalleryApiService = MockGalleryApiService();
    repository = GalleryRepositoryImpl(mockGalleryApiService);
  });
  final tQuery = 'space';
  final tPerPage = '10';
  final tGalleryEntity = GalleryEntity(results: [],totalPages: 0,total: 0);

  group('getPhotosByQuery', () {


    test('should return DataSuccess when the call to GalleryApiService is successful', () async {
      // arrange
      when(mockGalleryApiService.getPhotosByQuery(
          per_page: tPerPage,
          query: tQuery,
          client_id: unsplashClientId
      )).thenAnswer((_) async => HttpResponse(tGalleryEntity,Response(statusCode: HttpStatus.ok, requestOptions: RequestOptions())));

      // act
      final result = await repository.getPhotosByQuery(tQuery, tPerPage);

      // assert
      expect(result.data, equals(DataSuccess(tGalleryEntity).data));
      verify(mockGalleryApiService.getPhotosByQuery(per_page: tPerPage, query: tQuery, client_id: anyNamed('client_id')));
      verifyNoMoreInteractions(mockGalleryApiService);
    });


    test('should throw exception when there is a problem', () async {
      // arrange
      final tException = DioException(
        requestOptions: RequestOptions(path: 'path'),
        error: 'Something went wrong!',
      );

      when(mockGalleryApiService.getPhotosByQuery(
          per_page: tPerPage,
          query: tQuery,
          client_id: unsplashClientId
      )).thenThrow(tException);

      // act
      final result = await repository.getPhotosByQuery(tQuery, tPerPage);

      // assert
      expect(result.error, equals(tException));
      verify(mockGalleryApiService.getPhotosByQuery(per_page: tPerPage, query: tQuery, client_id: unsplashClientId));
      verifyNoMoreInteractions(mockGalleryApiService);
    });

  });





}
