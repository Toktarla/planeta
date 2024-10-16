import 'package:equatable/equatable.dart';

import '../../../../domain/entities/nasa_article_entity.dart';

abstract class LocalNasaArticleState extends Equatable {
    final List<NasaArticleEntity>? nasaArticles;

    const LocalNasaArticleState({this.nasaArticles});

    @override
    List<Object> get props => [nasaArticles!];


}


class LocalNasaArticleLoading extends LocalNasaArticleState {
  const LocalNasaArticleLoading();
}


class LocalNasaArticleDone extends LocalNasaArticleState {
  const LocalNasaArticleDone(List<NasaArticleEntity> nasaArticles) : super(nasaArticles: nasaArticles);
}
