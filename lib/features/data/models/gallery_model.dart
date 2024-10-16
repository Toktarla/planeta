import 'package:untitled/features/domain/entities/gallery_entity.dart';

class GalleryModel extends GalleryEntity {
  GalleryModel({required int total, required int totalPages, required List<Result> results}) : super(
    total: total,
    results: results,
    totalPages: totalPages
  );

  factory GalleryModel.fromJson(Map<String,dynamic> map){

    return GalleryModel(
        total: map['total'] ?? 0,
        totalPages: map['total_pages'] ?? 0,
        results: map['results'] ?? []
    );
  }

  factory GalleryModel.fromEntity(GalleryEntity entity) {
    return GalleryModel(
        total: entity.total,
        totalPages: entity.totalPages,
        results: entity.results
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'total': total,
      'total_pages': totalPages,
      'results': results,

    };
  }

}