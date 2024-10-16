import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';
import 'package:untitled/features/domain/entities/nasa_article_entity.dart';

abstract class RemoteNasaArticleState extends Equatable {
  final NasaArticleEntity?  nasaArticleEntity;
  final DioException?  error;

  const RemoteNasaArticleState({this.nasaArticleEntity,this.error});

  @override
  List<Object> get props => [];
}

class RemoteNasaArticleLaunching extends RemoteNasaArticleState {}

class RemoteNasaArticleLoading extends RemoteNasaArticleState {}

class RemoteNasaArticleDone extends RemoteNasaArticleState {
  const RemoteNasaArticleDone(NasaArticleEntity nasaArticleEntity) : super(nasaArticleEntity: nasaArticleEntity);
}

class RemoteNasaArticleError extends RemoteNasaArticleState {
  const RemoteNasaArticleError(DioException error) : super(error: error);
}