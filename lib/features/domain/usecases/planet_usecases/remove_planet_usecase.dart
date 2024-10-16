
import 'package:untitled/features/domain/entities/planet_entity.dart';
import 'package:untitled/features/domain/repository/planet_repository.dart';

import '../../../../core/usecase/usecase.dart';

class RemovePlanetUseCase implements UseCase<void,PlanetEntity> {

  final PlanetRepository _planetRepository;

  RemovePlanetUseCase(this._planetRepository);


  @override
  Future<void> call({PlanetEntity? params}) {
    return _planetRepository.removePlanet(params!);
  }




}