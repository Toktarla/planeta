
import 'package:equatable/equatable.dart';
import 'package:untitled/features/domain/entities/planet_entity.dart';

abstract class LocalPlanetEvent extends Equatable {
  final PlanetEntity? planetEntity;
  const LocalPlanetEvent({this.planetEntity});

  @override
  List<Object> get props => [planetEntity!];
}


class GetSavedPlanetsEvent extends LocalPlanetEvent {
  const GetSavedPlanetsEvent();
}


class SavePlanetEvent extends LocalPlanetEvent {

  const SavePlanetEvent(PlanetEntity planetEntity) : super(planetEntity: planetEntity);
}


class RemovePlanetEvent extends LocalPlanetEvent {
  const RemovePlanetEvent(PlanetEntity planetEntity) : super(planetEntity: planetEntity);
}