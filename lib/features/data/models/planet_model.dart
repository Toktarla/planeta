
import 'package:floor/floor.dart';

import '../../../core/constants/constants.dart';
import '../../domain/entities/planet_entity.dart';
@Entity(tableName: 'planets',primaryKeys: ['name'])
class PlanetModel extends PlanetEntity {
  const PlanetModel({
    String? name,
    String? description,
    String? image_url,
    String? planetType,
    String? explanation,
    String? whatis,
    String? destination

  }): super(
    name: name,
    description: description,
    image_url: image_url,
    planetType: planetType,
    explanation: explanation,
    whatis: whatis,
    destination: destination
  );

  factory PlanetModel.fromJson(Map<String,dynamic> map){

    return PlanetModel(
        name: map['name'] ?? "",
        image_url: map['image_url'] ?? apodDefaultImageUrl,
        description: map['description'] ?? "",
        explanation: map['explanation'] ?? "",
        whatis: map['whatis'] ?? "",
        planetType: map['planetType'] ?? "",
        destination: map['destination'] ?? "",
    );
  }

  factory PlanetModel.fromEntity(PlanetEntity entity) {
    return PlanetModel(
        name: entity.name,
        image_url: entity.image_url,
        description: entity.description,
        explanation: entity.explanation,
        whatis: entity.whatis,
        planetType: entity.planetType,
        destination: entity.destination
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'image_url': image_url,
      'planetType': planetType,
      'explanation': explanation,
      'whatis': whatis,
      'destination': destination
    };
  }


}