import 'package:equatable/equatable.dart';

import '../../../../domain/entities/planet_entity.dart';

abstract class LocalPlanetState extends Equatable {
  final List<PlanetEntity>? planets;
  const LocalPlanetState({this.planets})


  ;

  @override
  List<Object> get props => [planets!];
}


class LocalPlanetLoading extends LocalPlanetState {
  const LocalPlanetLoading();
}

class LocalPlanetDone extends LocalPlanetState {
  const LocalPlanetDone(List<PlanetEntity> planets) : super(planets: planets);
}