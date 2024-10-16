import 'package:floor/floor.dart';
import 'package:untitled/features/data/models/planet_model.dart';

@dao
abstract class PlanetDAO {
  @Insert()
  Future<void> insertNasaArticle(PlanetModel model);

  @delete
  Future<void> removeNasaArticle(PlanetModel model);

  @Query('SELECT * FROM planets')
  Future<List<PlanetModel>> getSavedNasaArticles();


}