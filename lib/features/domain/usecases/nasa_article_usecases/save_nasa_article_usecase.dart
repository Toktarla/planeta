import 'package:untitled/core/resources/usecase.dart';
import 'package:untitled/features/domain/entities/nasa_article_entity.dart';
import 'package:untitled/features/domain/repository/nasa_article_repository.dart';

class SaveNasaArticleUseCase implements UseCase<void,NasaArticleEntity> {


  final NasaArticleRepository _nasaArticleRepository;

  SaveNasaArticleUseCase(this._nasaArticleRepository);

  @override
  Future<void> call({NasaArticleEntity? params}) {

    return _nasaArticleRepository.saveNasaArticle(params!);

  }
}