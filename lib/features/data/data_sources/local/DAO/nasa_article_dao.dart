
import 'package:floor/floor.dart';
import 'package:untitled/features/data/models/nasa_article_model.dart';
@dao
abstract class NasaArticleDao {

  @Insert()
  Future<void> insertNasaArticle(NasaArticleModel model);

  @delete 
  Future<void> removeNasaArticle(NasaArticleModel model);

  @Query('SELECT * FROM nasaArticle')
  Future<List<NasaArticleModel>> getSavedNasaArticles();



}