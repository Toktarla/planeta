import 'dart:io';
import 'package:dio/dio.dart';
import 'package:untitled/core/constants/constants.dart';
import 'package:untitled/core/resources/data_state.dart';
import 'package:untitled/features/data/data_sources/local/app_database.dart';
import 'package:untitled/features/data/data_sources/remote/nasa_article/nasa_article_api_service.dart';
import 'package:untitled/features/data/models/nasa_article_model.dart';
import 'package:untitled/features/domain/entities/nasa_article_entity.dart';
import 'package:untitled/features/domain/repository/nasa_article_repository.dart';

import '../../../core/errors/exceptions.dart';

class NasaArticleRepositoryImpl extends NasaArticleRepository {
  final NasaArticleApiService _nasaArticleApiService;
  final AppDatabase _appDatabase;

  NasaArticleRepositoryImpl(this._nasaArticleApiService, this._appDatabase);

  @override
  Future<DataState<NasaArticleEntity>> getNasaArticles(String selectedDate) async {
    try {
      final httpResponse = await _nasaArticleApiService.getNasaArticles(
        api_key:apodAPIkey,
        date: selectedDate
      );
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);

      } else {
        return DataFailure(

            DioException(
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

  @override
  Future<List<NasaArticleEntity>> getSavedNasaArticles() {
    try {
      return _appDatabase.nasaArticleDAO.getSavedNasaArticles();
    } catch(e) {
        throw Exception("Getting Saved Articles Failed");
    }
  }

  @override
  Future<void> removeNasaArticle(NasaArticleEntity nasaArticle) {
    try {
      return _appDatabase.nasaArticleDAO.removeNasaArticle(NasaArticleModel.fromEntity(nasaArticle));

    } catch (e) {
      throw DatabaseRemoveException("Delete operation to database failed");
    }
  }

  @override
  Future<void> saveNasaArticle(NasaArticleEntity nasaArticle) {
    try {
      return _appDatabase.nasaArticleDAO.insertNasaArticle(NasaArticleModel.fromEntity(nasaArticle));
    } catch (e) {
      throw DatabaseInsertException("Insertion to database failed");

    }
  }

}