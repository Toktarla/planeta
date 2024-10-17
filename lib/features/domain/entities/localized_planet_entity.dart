import 'package:untitled/features/domain/entities/planet_entity.dart';

class LocalizedPlanetEntity extends PlanetEntity {
  final String? name;
  final String? description;
  final String? image_url;
  final String? planetType;
  final String? explanation;
  final String? whatis;



  const LocalizedPlanetEntity({
    this.name,
    this.description,
    this.image_url,
    this.planetType,
    this.explanation,
    this.whatis
  });

  @override
  // TODO: implement props
  List<Object?> get props => [name,description,image_url,explanation,planetType,explanation,whatis];
}