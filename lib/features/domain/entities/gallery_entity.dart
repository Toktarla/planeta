import 'package:equatable/equatable.dart';

class GalleryEntity extends Equatable{
  int total;
  int totalPages;
  List<Result> results;

  GalleryEntity({
    required this.total,
    required this.totalPages,
    required this.results,
  });

  factory GalleryEntity.fromJson(Map<String, dynamic> json) {
    var list = json['results'] as List;
    List<Result> resultsList = list.map((i) => Result.fromJson(i as Map<String,dynamic>)).toList();

    return GalleryEntity(
      total: json['total'] ?? 0,
      totalPages: json['total_pages'] ?? 0,
      results: resultsList ?? [],
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [total,totalPages,results];

}

class Result extends Equatable{
  String id;
  String description;
  String altDescription;
  Urls urls;
  Links links;
  int likes;

  Result({
    required this.id,
    required this.description,
    required this.altDescription,
    required this.urls,
    required this.links,
    required this.likes,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      id: json['id'] ?? "",
      description: json['description'] ?? "",
      altDescription: json['alt_description'] ?? "",
      urls: Urls.fromJson(json['urls']),
      links: Links.fromJson(json['links']),
      likes: json['likes'] ?? 0,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id,description,altDescription,urls,links,likes];
}

class Links extends Equatable {
  String self;
  String html;
  String download;
  String downloadLocation;

  Links({
    required this.self,
    required this.html,
    required this.download,
    required this.downloadLocation,
  });

  factory Links.fromJson(Map<String, dynamic> json) {
    return Links(
      self: json['self'] ?? "",
      html: json['html'] ?? "",
      download: json['download'] ?? "",
      downloadLocation: json['download_location'] ?? "",
    );
  }
  @override
  // TODO: implement props
  List<Object?> get props => [self,html,download,downloadLocation];


}

class Urls extends Equatable {
  String raw;
  String full;
  String regular;
  String small;
  String thumb;

  Urls({
    required this.raw,
    required this.full,
    required this.regular,
    required this.small,
    required this.thumb,
  });

  factory Urls.fromJson(Map<String, dynamic> json) {
    return Urls(
      raw: json['raw'] ?? "",
      full: json['full'] ?? "",
      regular: json['regular'] ?? "",
      small: json['small'] ?? "",
      thumb: json['thumb'] ?? "",
    );
  }
  @override
  // TODO: implement props
  List<Object?> get props => [raw,full,regular,small,thumb];

}