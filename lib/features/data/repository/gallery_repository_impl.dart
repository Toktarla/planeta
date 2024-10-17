import 'dart:io';

import 'package:dio/dio.dart';
import 'package:untitled/core/constants/constants.dart';
import 'package:untitled/core/resources/data_state.dart';
import 'package:untitled/features/data/data_sources/remote/gallery/gallery_api_service.dart';
import 'package:untitled/features/domain/entities/gallery_entity.dart';
import 'package:untitled/features/domain/repository/gallery_repository.dart';


class GalleryRepositoryImpl extends GalleryRepository {

  final GalleryApiService _galleryApiService;
  GalleryRepositoryImpl(this._galleryApiService);

  @override
  Future<DataState<GalleryEntity>> getPhotosByQuery(String query, String perPage) async {
    try {
      final httpResponse = await _galleryApiService.getPhotosByQuery(
          per_page: perPage,
          query: query,
          client_id: unsplashClientId,
      );
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);

      } else {
        return DataFailure(

            DioException(
              message: httpResponse.response.statusMessage,

                error: httpResponse.response.statusMessage,
                response: httpResponse.response,
                requestOptions: httpResponse.response.requestOptions
            )
        );
      }
    } on DioException catch(e){

      return DataFailure(e);
    }
  }

}