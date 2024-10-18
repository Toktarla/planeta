import 'package:untitled/core/resources/data_state.dart';
import 'package:untitled/core/resources/usecase.dart';
import 'package:untitled/features/domain/entities/nasa_article_entity.dart';
import 'package:untitled/features/domain/repository/nasa_article_repository.dart';

class GetNasaArticlesUseCase implements UseCase<DataState<NasaArticleEntity>, String>{


    final NasaArticleRepository _nasaArticleRepository;

    GetNasaArticlesUseCase(this._nasaArticleRepository);

  @override
  Future<DataState<NasaArticleEntity>> call({String? params}) {
    return _nasaArticleRepository.getNasaArticles(params!);
  }




}