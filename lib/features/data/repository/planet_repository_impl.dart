
import 'package:untitled/features/data/data_sources/local/app_database.dart';
import 'package:untitled/features/data/models/planet_model.dart';
import 'package:untitled/features/domain/entities/planet_entity.dart';
import 'package:untitled/features/domain/repository/nasa_article_repository.dart';
import 'package:untitled/features/domain/repository/planet_repository.dart';

import '../../../core/exceptions/exceptions.dart';

class PlanetRepositoryImpl extends PlanetRepository {

  final AppDatabase _appDatabase;

  PlanetRepositoryImpl(this._appDatabase);

  @override
  Future<List<PlanetEntity>> getSavedNasaArticles() {
        return _appDatabase.planetDAO.getSavedNasaArticles();
  }

  @override
  Future<void> removePlanet(PlanetEntity planetEntity) {
    try {
      return _appDatabase.planetDAO.removeNasaArticle(PlanetModel.fromEntity(planetEntity));
    } catch (e) {
      throw DatabaseRemoveException("Delete operation to database failed");
    }
  }

  @override
  Future<void> savePlanet(PlanetEntity planetEntity) {
    try {
      return _appDatabase.planetDAO.insertNasaArticle(PlanetModel.fromEntity(planetEntity));
    } catch (e) {
      throw DatabaseInsertException("Insertion to database failed");

    }
  }

}