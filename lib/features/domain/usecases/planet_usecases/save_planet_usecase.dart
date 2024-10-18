import 'package:untitled/core/resources/usecase.dart';
import 'package:untitled/features/domain/entities/nasa_article_entity.dart';
import 'package:untitled/features/domain/entities/planet_entity.dart';
import 'package:untitled/features/domain/repository/nasa_article_repository.dart';
import 'package:untitled/features/domain/repository/planet_repository.dart';

class SavePlanetUseCase implements UseCase<void,PlanetEntity> {


  final PlanetRepository _planetRepository;

  SavePlanetUseCase(this._planetRepository);

  @override
  Future<void> call({PlanetEntity? params}) {

    return _planetRepository.savePlanet(params!);

  }
}