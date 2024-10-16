import 'package:untitled/features/domain/entities/planet_entity.dart';

abstract class PlanetRepository {

  // Remote Methods ...


  // Local Methods

  Future<List<PlanetEntity>> getSavedNasaArticles();


  Future<void> savePlanet(PlanetEntity planetEntity);

  Future<void> removePlanet(PlanetEntity planetEntity);




}