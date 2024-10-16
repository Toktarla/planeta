

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/core/resources/data_state.dart';
import 'package:untitled/features/domain/usecases/nasa_article_usecases/get_nasa_article_usecase.dart';
import 'package:untitled/features/presentation/bloc/nasa_article/remote/remote_nasa_article_event.dart';
import 'package:untitled/features/presentation/bloc/nasa_article/remote/remote_nasa_article_state.dart';

class RemoteNasaArticleBloc extends Bloc<RemoteNasaArticleEvent,RemoteNasaArticleState> {


  final GetNasaArticlesUseCase _getNasaArticlesUseCase;

  RemoteNasaArticleBloc(this._getNasaArticlesUseCase) : super(RemoteNasaArticleLaunching()) {
    on<GetNasaArticlesEvent> (onGetNasaArticlesEvent);
  }

  void onGetNasaArticlesEvent(GetNasaArticlesEvent event,Emitter<RemoteNasaArticleState> emit) async {
      final dataState = await _getNasaArticlesUseCase.call(params: event.selectedDate);
      emit(RemoteNasaArticleLoading());
      await Future.delayed(Duration(seconds: 1));
      if (dataState is DataSuccess && dataState.data != null) {
          emit(RemoteNasaArticleDone(dataState.data!));
      }
      else {

        print("Error message : ${dataState.error!.message}");


        emit(RemoteNasaArticleError(dataState.error!));
      }


  }


}