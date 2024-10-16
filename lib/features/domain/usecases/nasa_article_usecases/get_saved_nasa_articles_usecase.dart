import 'package:untitled/core/usecase/usecase.dart';
import 'package:untitled/features/domain/entities/nasa_article_entity.dart';
import 'package:untitled/features/domain/repository/nasa_article_repository.dart';

class GetSavedNasaArticlesUseCase implements UseCase<List<NasaArticleEntity>, void> {


  final NasaArticleRepository _nasaArticleRepository;

  GetSavedNasaArticlesUseCase(this._nasaArticleRepository);


  @override
  Future<List<NasaArticleEntity>> call({void params}) {
    return _nasaArticleRepository.getSavedNasaArticles();
  }
}