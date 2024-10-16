import 'package:untitled/features/domain/entities/nasa_article_entity.dart';

import '../../../core/resources/data_state.dart';

abstract class NasaArticleRepository {

  // API Methods

  Future<DataState<NasaArticleEntity>> getNasaArticles(String selectedDate);




  // Database Methods

  Future<List<NasaArticleEntity>> getSavedNasaArticles();

  Future<void> saveNasaArticle(NasaArticleEntity nasaArticle);

  Future<void> removeNasaArticle(NasaArticleEntity nasaArticle);

}