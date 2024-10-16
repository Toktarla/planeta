import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/features/presentation/bloc/nasa_article/local/local_nasa_article_event.dart';
import 'package:untitled/features/presentation/bloc/nasa_article/local/local_nasa_article_state.dart';

import '../../../../domain/usecases/nasa_article_usecases/get_saved_nasa_articles_usecase.dart';
import '../../../../domain/usecases/nasa_article_usecases/remove_nasa_article_usecase.dart';
import '../../../../domain/usecases/nasa_article_usecases/save_nasa_article_usecase.dart';

class LocalNasaArticleBloc extends Bloc<LocalNasaArticleEvent,LocalNasaArticleState> {
  final GetSavedNasaArticlesUseCase _getSavedNasaArticlesUseCase;
  final RemoveNasaArticleUseCase _removeNasaArticleUseCase;
  final SaveNasaArticleUseCase _saveNasaArticlesUseCase;

   LocalNasaArticleBloc(
    this._getSavedNasaArticlesUseCase,
    this._removeNasaArticleUseCase,
    this._saveNasaArticlesUseCase) : super(const LocalNasaArticleLoading()) {
     on<GetSavedNasaArticlesEvent> (onGetSavedNasaArticles);
     on<RemoveNasaArticleEvent> (onRemoveNasaArticle);
     on<SaveNasaArticleEvent> (onSaveNasaArticle);
   }

  void onGetSavedNasaArticles(GetSavedNasaArticlesEvent event,Emitter<LocalNasaArticleState> emit) async {
    final articles = await _getSavedNasaArticlesUseCase.call();
    emit(LocalNasaArticleDone(articles));
  }

  void onRemoveNasaArticle(RemoveNasaArticleEvent removeArticle,Emitter<LocalNasaArticleState> emit) async {
    await _removeNasaArticleUseCase(params: removeArticle.nasaArticleEntity);
    final articles = await _getSavedNasaArticlesUseCase();
    emit(LocalNasaArticleDone(articles));
  }

  void onSaveNasaArticle(SaveNasaArticleEvent saveArticle,Emitter<LocalNasaArticleState> emit) async {
     await _saveNasaArticlesUseCase(params: saveArticle.nasaArticleEntity);

    final articles = await _getSavedNasaArticlesUseCase();

    emit(LocalNasaArticleDone(articles));

  }

}