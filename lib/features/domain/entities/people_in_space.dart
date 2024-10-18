import 'package:equatable/equatable.dart';

class AstroResponse extends Equatable {
  final int number;
  final int issExpedition;
  final String expeditionPatch;
  final String expeditionUrl;
  final String expeditionImage;
  final List<Astronaut> people;

  AstroResponse({
    required this.number,
    required this.issExpedition,
    required this.expeditionPatch,
    required this.expeditionUrl,
    required this.expeditionImage,
    required this.people,
  });

  factory AstroResponse.fromJson(Map<String, dynamic> json) {
    return AstroResponse(
      number: json['number'],
      issExpedition: json['iss_expedition'],
      expeditionPatch: json['expedition_patch'],
      expeditionUrl: json['expedition_url'],
      expeditionImage: json['expedition_image'],
      people: (json['people'] as List)
          .map((data) => Astronaut.fromJson(data))
          .toList(),
    );
  }

  @override
  List<Object?> get props => [
    number,
    issExpedition,
    expeditionPatch,
    expeditionUrl,
    expeditionImage,
    people,
  ];
}

class Astronaut extends Equatable {
  final String name;
  final String country;
  final String agency;
  final String position;
  final String spacecraft;
  final String imageUrl;
  final String url;
  final bool iss;
  final String? instagram;
  final String? twitter;
  final String? facebook;

  Astronaut({
    required this.name,
    required this.country,
    required this.agency,
    required this.position,
    required this.spacecraft,
    required this.imageUrl,
    required this.iss,
    required this.url,
    this.instagram,
    this.twitter,
    this.facebook,
  });

  factory Astronaut.fromJson(Map<String, dynamic> json) {
    return Astronaut(
      name: json['name'],
      country: json['country'],
      agency: json['agency'],
      position: json['position'],
      spacecraft: json['spacecraft'],
      imageUrl: json['image'],
      iss: json['iss'],
      url: json['url'],
      instagram: json['instagram'] != '' ? json['instagram'] : null,
      twitter: json['twitter'] != '' ? json['twitter'] : null,
      facebook: json['facebook'] != '' ? json['facebook'] : null,
    );
  }

  @override
  List<Object?> get props => [
    name,
    country,
    agency,
    position,
    spacecraft,
    imageUrl,
    iss,
    instagram,
    twitter,
    facebook,
    url
  ];
}
