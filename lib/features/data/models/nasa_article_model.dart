
import 'package:floor/floor.dart';
import 'package:untitled/features/domain/entities/nasa_article_entity.dart';

import '../../../core/constants/constants.dart';

@Entity(tableName: 'nasaArticle',primaryKeys: ['title'])
class NasaArticleModel extends NasaArticleEntity{

  const NasaArticleModel({
    String? title,
    String? hdurl,
    String? date,
    String? explanation,
    String? copyright
  }) : super(
    title: title,
      hdurl: hdurl,
    date: date,
    explanation: explanation,
    copyright: copyright
  );

  factory NasaArticleModel.fromJson(Map<String,dynamic> map){

    return NasaArticleModel(
      title: map['title'] ?? "",
        hdurl: map['hdurl'] ?? apodDefaultImageUrl,
      date: map['date'] ?? apodDefaultDate,
      explanation: map['explanation'] ?? "",
      copyright: map['copyright'] ?? ""
    );
  }

  factory NasaArticleModel.fromEntity(NasaArticleEntity entity) {
    return NasaArticleModel(
      title: entity.title,
        hdurl: entity.hdurl,
      date: entity.date,
      explanation: entity.explanation,
      copyright: entity.copyright
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'hdurl': hdurl,
      'date': date,
      'explanation': explanation,
      'copyright': copyright,
    };
  }
}