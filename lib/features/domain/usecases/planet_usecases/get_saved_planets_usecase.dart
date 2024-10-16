
import 'package:untitled/features/domain/entities/planet_entity.dart';
import 'package:untitled/features/domain/repository/planet_repository.dart';

import '../../../../core/usecase/usecase.dart';

class GetSavedPlanetsUseCase implements UseCase<List<PlanetEntity>,void> {

  final PlanetRepository _planetRepository;

  GetSavedPlanetsUseCase(this._planetRepository);

  @override
  Future<List<PlanetEntity>> call({void params}) {
      return _planetRepository.getSavedNasaArticles();
  }

}