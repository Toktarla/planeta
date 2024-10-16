
import 'package:equatable/equatable.dart';
import 'package:untitled/features/domain/entities/nasa_article_entity.dart';

abstract class LocalNasaArticleEvent extends Equatable{
  final NasaArticleEntity? nasaArticleEntity;
  const LocalNasaArticleEvent({this.nasaArticleEntity});

  @override
  List<Object> get props => [nasaArticleEntity!];
}


class GetSavedNasaArticlesEvent extends LocalNasaArticleEvent {
  const GetSavedNasaArticlesEvent();
}

class RemoveNasaArticleEvent extends LocalNasaArticleEvent {
  const RemoveNasaArticleEvent(NasaArticleEntity nasaArticleEntity) : super(nasaArticleEntity: nasaArticleEntity);
}

class SaveNasaArticleEvent extends LocalNasaArticleEvent {
  const SaveNasaArticleEvent(NasaArticleEntity nasaArticleEntity) : super(nasaArticleEntity: nasaArticleEntity);
}