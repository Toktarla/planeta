import 'package:equatable/equatable.dart';

class AstroResponse extends Equatable{
  final String message;
  final int number;
  final List<Astronaut> people;

  AstroResponse({
    required this.message,
    required this.number,
    required this.people,
  });

  factory AstroResponse.fromJson(Map<String, dynamic> json) {
    return AstroResponse(
      message: json['message'],
      number: json['number'],
      people: (json['people'] as List)
          .map((data) => Astronaut.fromJson(data))
          .toList(),
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [message,number,people];
}

class Astronaut extends Equatable{
  final String craft;
  final String name;

  Astronaut({
    required this.craft,
    required this.name,
  });

  factory Astronaut.fromJson(Map<String, dynamic> json) {
    return Astronaut(
      craft: json['craft'],
      name: json['name'],
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [craft,name];
}
