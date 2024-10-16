import 'package:untitled/core/usecase/usecase.dart';
import 'package:untitled/features/domain/entities/nasa_article_entity.dart';
import 'package:untitled/features/domain/repository/nasa_article_repository.dart';

class RemoveNasaArticleUseCase implements UseCase<void,NasaArticleEntity> {


  final NasaArticleRepository _nasaArticleRepository;

  RemoveNasaArticleUseCase(this._nasaArticleRepository);

  @override
  Future<void> call({NasaArticleEntity? params}) {

    return _nasaArticleRepository.removeNasaArticle(params!);

  }
}